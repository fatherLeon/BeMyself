import Foundation

func solution(_ s: String) -> Int {
    
    let arr = Array(s).map { String($0) }
    var initWord: String? = nil
    var initWordCount = 0
    var otherWordCount = 0
    var splitedWord = ""
    var result: [String] = []
    
    for a in arr {
        guard let word = initWord else {
            initWord = a
            initWordCount += 1
            splitedWord += a
            
            continue
        }
        
        if word == a {
            initWordCount += 1
            splitedWord += a
        } else {
            otherWordCount += 1
            splitedWord += a
        }
        
        if initWordCount == otherWordCount {
            result.append(splitedWord)
            
            initWord = nil
            initWordCount = 0
            otherWordCount = 0
            splitedWord = ""
        }
    }
    
    if initWord == nil {
        return result.count
    } else {
        result.append(initWord!)
        return result.count
    }
}
