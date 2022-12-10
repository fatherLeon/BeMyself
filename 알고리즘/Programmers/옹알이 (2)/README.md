#  프로그래머스 - 옹알이 (2)

> 참조 : https://velog.io/@sangwoo24/Programmers-옹알이2.swift

* 기존 contain과 split을 통해서 접근할려고 하였지만 "yeye", "maamaa"와 같이 붙어있는 babbling은 해결이 힘들었음
* 위 링크를 참조하여 글자 하나씩 words와 비교하였음.

```swift
import Foundation

func solution(_ babbling: [String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"] // 말할 수 있는 것
    var answer = 0
    
    for word in babbling {
        var result = ""
        var lastWord = ""
        
        for x in word.map { String($0) } {
            result += x
            
            if words.contains(result) && result != lastWord {
                lastWord = result
                result = ""
            }
        }

        if result == "" {
            answer += 1
        }
    }
    
    return answer
}
```


