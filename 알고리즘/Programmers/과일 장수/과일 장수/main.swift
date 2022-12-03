import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var result = 0
    var apples = score.sorted(by: <)
    
    for _ in 0..<(score.count / m) {
        var box: [Int] = []
        
        for _ in 0..<m {
            box.append(apples.removeLast())
        }
        
        result += box.min()! * m
    }
    
    return result
}
