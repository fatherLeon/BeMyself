#  프로그래머스 - 롤케이크 자리그

## 초기 접근법
* 배열 처음부터 접근하여 케이크를 잘랐을 때 토핑 개수를 확인하여 같을 경우 result를 더해주는 방식

```swift
import Foundation

func solution(_ topping: [Int]) -> Int {
    var result = 0
    
    for index in 1..<topping.count {
        let firstCakeTopping = Set(topping[0..<index])
        let secondCakeTopping = Set(topping[index...topping.count-1])
        
        if firstCakeTopping.count == secondCakeTopping.count {
            result += 1
        }
    }
    
    return result
}
```

* 결과 - 시간초과

## 정답
> https://velog.io/@eunsung-dev/프로그래머스-롤케이크-자르기
* 기존 배열을 잘라서 각각 토핑 개수를 확인했었다
* 그러나 시간초과였고 위 링크의 접근법을 확인해본 결과 배열을 통해서 각각의 토핑개수를 확인하였고 토핑개수를 하나씩 빼서 토핑개수가 0이라면 topping2의 토핑이 하나 빠진거이므로 topping2를 하나 삭제하는 방식으로 만드는게 정답이었다

```swift
import Foundation

func solution(_ topping: [Int]) -> Int {
    var topping1 = Set<Int>()
    var topping2 = Set(topping)
    var arr = Array(repeating: 0, count: topping.max()! + 1)
    var result = 0

    for x in 0..<topping.count {
        let t = topping[x]
        arr[t] += 1
    }

    for index in 0..<topping.count-1 {
        let t = topping[index]
        topping1.insert(t)
        arr[t] -= 1
        
        if arr[t] == 0 {
            topping2.remove(t)
        }
        
        if topping1.count == topping2.count {
            result += 1
        }
    }
    
    return result
}
```
