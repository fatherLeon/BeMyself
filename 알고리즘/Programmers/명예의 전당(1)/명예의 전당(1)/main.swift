import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var frameScore: [Int] = []
    var result: [Int] = []
    
    for s in score {
        if frameScore.count > k-1 {
            if frameScore[0] < s {
                frameScore[0] = s
                frameScore.sort()
            }
        } else {
            frameScore.append(s)
            frameScore.sort()
        }
        
        result.append(frameScore[0])
    }
    
    return result
}
