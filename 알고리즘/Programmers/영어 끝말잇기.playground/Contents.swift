import Foundation

func connected(word previousWord: String, to word: String) -> Bool {
    guard let lastAlphabet = previousWord.last,
          let firstAlphabet = word.first,
          lastAlphabet == firstAlphabet else {
        return false
    }
    
    return true
}

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var previousWord = ""
    var finishLocation = 0
    var removedWords: [String] = []
    var reversedWords = words
    
    reversedWords.reverse()
    
    while let word = reversedWords.popLast() {
        finishLocation += 1
        
        if previousWord == "" {
            previousWord = word
            removedWords.append(word)
            continue
        }
        
        if removedWords.contains(word) || !connected(word: previousWord, to: word) {
            break
        }
        
        previousWord = word
        removedWords.append(word)
    }
    
    if previousWord == words.last! {
        return [0, 0]
    }
    
    if finishLocation == words.count {
        return [finishLocation % n == 0 ? n: finishLocation % n, Int(ceil(Double(finishLocation) / Double(n)))]
    }
    
    return [finishLocation % n == 0 ? n: finishLocation % n,
            Int(ceil(Double(finishLocation) / Double(n)))]
}

solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])
solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])
