//// 1번째 실패
//import Foundation
//
//func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
//    var answer = 0
//    var results: [Int] = []
//    var wall = section
//
//    while !wall.isEmpty {
//        let value = wall.removeFirst()
//
//        if results.isEmpty {
//            results.append(value)
//            continue
//        }
//
//        if results.min()! + m - 1 < value {
//            results.removeAll()
//            results.append(value)
//            answer += 1
//        } else {
//            results.append(value)
//        }
//    }
//
//    if results.isEmpty {
//        return answer
//    } else {
//        return answer + 1
//    }
//}
//
//
//// 2번째 실패
//import Foundation
//
//func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
//    var answer = 0
//    var results: [Int] = []
//    var wall = section
//
//    wall.forEach { value in
//        if results.isEmpty {
//            results.append(value)
//            return
//        }
//
//        if results.min()! + m - 1 < value {
//            results = []
//            results.append(value)
//            answer += 1
//        } else {
//            results.append(value)
//        }
//    }
//
//    if results.isEmpty {
//        return answer
//    } else {
//        return answer + 1
//    }
//}


// 정답
import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var answer = 0
    
    section.reduce(section.min()!) { partialResult, value in
        if partialResult + m - 1 < value {
            answer += 1
            return value
        }
        
        return partialResult
    }
    
    return answer + 1
}
