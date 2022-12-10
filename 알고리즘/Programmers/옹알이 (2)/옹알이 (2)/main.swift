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
