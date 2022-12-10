import Foundation

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
