#  프로그래머스 - 귤 고르기

## 초기 접근법
* 최대 많은 크기의 귤부터 접근하여 k와 비교해 k의 이상이 될 때까지 만듬

```
func solution(_ k: Int, _ tangerine: [Int])  -> Int {
    var countArray: [Int] = []
    var result = 0
    var answer = 0
    
    for tang in Set(tangerine) {
        countArray.append(tangerine.filter { $0 == tang }.count)
    }
    
    countArray.sort { (a, b) -> Bool in
        return a > b
    }
    
    for count in countArray {
        result += count
        answer += 1
        if result >= k {
            break
        }
    }
    
    return answer
}
```
* 결과 : 실패 (시간초과)

## 정답
* filter 함수 사용때문에 시간초과가 걸림.
* filter사용을 없애고 딕셔너리를 사용함

```
func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    var countDict: [Int: Int] = [:]
    var result = 0
    var answer = 0
    
    for tang in tangerine {
        guard let num = countDict[tang] else {
            countDict[tang] = 1
            continue
        }
        countDict[tang] = num + 1
    }
    
    let count = countDict.sorted { (a, b) -> Bool in
        return a.value > b.value
    }
    
    for (_, val) in count {
        result += val
        answer += 1
        if result >= k {
            break
        }
    }
    
    return answer
}
```
