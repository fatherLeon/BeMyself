import Foundation

//func solution(_ players:[String], _ callings:[String]) -> [String] {
//
//    var runner = players
//
//    for calling in callings {
//        let index = runner.firstIndex(of: calling)!
//
//        runner.swapAt(index-1, index)
//    }
//
//    return runner
//}

solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])


func solution(_ players:[String], _ callings:[String]) -> [String] {

    var runner: [String: Int] = [:]
    var ranking: [Int: String] = [:]

    for (i, name) in players.enumerated() {
        runner[name] = i + 1
        ranking[i + 1] = name
    }

    for calling in callings {

    }

    return []
}
