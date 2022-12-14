#  프로그래머스 - 피로도

## 접근법
* 순열(permutation)구현을 하여 각 케이스마다 피로도를 계산하여준다
> 참고 https://bongcando.tistory.com/22

```
import Foundation

func permutaionWithRecursion(array: [Int], pickCount: Int, permutationArray: inout [[Int]], index: Int = 0) {
    if index == pickCount {
        permutationArray.append(Array(array[0..<index]))
        return
    }
    
    var arr = array
    
    for i in index..<arr.count {
        arr.swapAt(index, i)
        permutaionWithRecursion(array: arr, pickCount: pickCount, permutationArray: &permutationArray, index: index + 1)
        arr.swapAt(index, i)
    }
}

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var arr: [Int] = []
    var permutationArr: [[Int]] = []
    var answer = 0

    arr.append(contentsOf: stride(from: 0, through: dungeons.count - 1, by: 1))
    permutaionWithRecursion(array: arr, pickCount: arr.count, permutationArray: &permutationArr)

    for permutation in permutationArr {
        var fatigue = k
        var result = 0
        
        for per in permutation {
            let leastFatigue = dungeons[per][0]
            let consumption = dungeons[per][1]
            
            if fatigue >= leastFatigue {
                fatigue -= consumption
                result += 1
            } else {
                break
            }
        }
        
        if result == dungeons.count {
            answer = result
            break
        }
        if result > answer {
            answer = result
        }
    }
    
    return answer
}
```
