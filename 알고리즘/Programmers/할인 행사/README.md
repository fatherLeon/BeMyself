#  프로그래머스 - 할인 행사

## 접근법
* 딕셔너리를 사용해 want항목을 하나씩 빼주며 총 합계가 0일 경우 result 값을 하나 씩 올림
* discount를 for문 끝까지 돌릴필요 없이 number의 합만큼 빼서 discount초기부터 discount.count - number만큼만 확인

```swift
import Foundation

func solution(_ want: [String], _ number: [Int], _ discount: [String]) -> Int {
    
    var shoppingBag: [String: Int] = [:]
    var sumNumber = number.reduce(0, +)
    var result = 0
    
    for (w, n) in zip(want, number) {
        shoppingBag[w] = n
    }
    
    for x in 0...discount.count-sumNumber {
        var cart = shoppingBag
        
        for y in x..<x+10 {
            if y >= discount.count {
                break
            }
            if cart[discount[y]] != nil {
                if cart[discount[y]]! == 0 {
                    continue
                }
                cart[discount[y]]! -= 1
            }
        }
        
        if Array(cart.values).reduce(0, +) == 0 {
            result += 1
        }
    }
    
    return result
}
```
