import Foundation

func makeScoreBook(_ name: [String], _ yearning: [Int]) -> [String: Int] {
    var scoreBook: [String: Int] = [:]
    
    for (n, score) in zip(name, yearning) {
        scoreBook[n] = score
    }
    
    return scoreBook
}

func calculateMissingScore(scoreBook: [String: Int], photo: [String]) -> Int {
    photo.reduce(0) { partialResult, name in
        if let score = scoreBook[name] {
            return partialResult + score
        }
        
        return partialResult
    }
}

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let scoreBook = makeScoreBook(name, yearning)
    var result: [Int] = []
    
    for p in photo {
        let score = calculateMissingScore(scoreBook: scoreBook, photo: p)
        
        result.append(score)
    }
    
    return result
}

solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]])
