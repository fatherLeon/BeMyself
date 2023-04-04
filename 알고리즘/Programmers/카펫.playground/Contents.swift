import Foundation

//func solution(_ brown:Int, _ yellow:Int) -> [Int] {
//    var yellowValue = yellow
//    var result = (1, yellowValue)
//
//    repeat {
//        let brownValue = calculatePerimeter(rect: result) + 4
//
//        if brown == brownValue {
//            break
//        }
//
//        yellowValue /= 2
//        result.0 += 2
//        result.1 = yellowValue
//    } while yellowValue % 2 == 0
//
//    var carfetResult: [Int] = [result.0, result.1]
//
//    carfetResult = carfetResult.sorted(by: >)
//
//    carfetResult = carfetResult.map { $0 + 2 }
//
//    return carfetResult
//}
//
//func calculatePerimeter(rect: (Int, Int)) -> Int {
//    return (rect.0 + rect.1) * 2
//}
//
//func solution(_ brown:Int, _ yellow:Int) -> [Int] {
//    let area = yellow
//    var yellowCaffet = (1, yellow)
//
//    if calculatePerimeter(rect: yellowCaffet) + 4 == brown {
//        return calculateCaffet(yellowCaffet: yellowCaffet)
//    }
//
//    while area % (yellowCaffet.0 + 1) == 0 {
//        yellowCaffet.0 += 1
//        yellowCaffet.1 = area / yellowCaffet.0
//
//        let brownValue = calculatePerimeter(rect: yellowCaffet) + 4
//
//        if brown == brownValue {
//            break
//        }
//        print(yellowCaffet)
//    }
//
//    return calculateCaffet(yellowCaffet: yellowCaffet)
//}
//
//func calculateCaffet(yellowCaffet: (Int, Int)) -> [Int] {
//    var caffet = [yellowCaffet.0 + 2, yellowCaffet.1 + 2]
//
//    caffet = caffet.sorted(by: >)
//
//    return caffet
//}
//
//func calculatePerimeter(rect: (Int, Int)) -> Int {
//    return (rect.0 + rect.1) * 2
//}


func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let yellows = calculateDivisors(yellow: yellow)
    var yellowCaffet = (1, yellow)
    
    print(yellows)
    
    for yellowValue in yellows {
        yellowCaffet.1 = yellowValue
        yellowCaffet.0 = yellow / yellowValue

        if calculatePerimeter(rect: yellowCaffet) + 4 == brown {
            return calculateCaffet(yellowCaffet: yellowCaffet)
        }
    }
    
    return calculateCaffet(yellowCaffet: yellowCaffet)
}

func calculateDivisors(yellow: Int) -> [Int] {
    return (1...yellow).filter { yellow % $0 == 0 }.sorted(by: >)
}

func calculateCaffet(yellowCaffet: (Int, Int)) -> [Int] {
    var caffet = [yellowCaffet.0 + 2, yellowCaffet.1 + 2]
    
    caffet = caffet.sorted(by: >)
    
    return caffet
}

func calculatePerimeter(rect: (Int, Int)) -> Int {
    return (rect.0 + rect.1) * 2
}

solution(8, 1)
solution(10, 2)
//solution(12, 3)
//solution(14, 4)
//solution(10, 6)
solution(24, 24)
solution(36, 64)

// 8 - 1 [3, 3] => 4 + 4
// 10 - 2 [4, 3] => 6 + 4
// 12 - 3 [5. 3] => 8 + 4
// 12 - 4 [4, 4] => 8 + 4
// 16 - 5 [6, 3] => 12 + 4
// 14 - 6 [5, 4] => 10 + 4

// 24 - 24 [8, 6] => 20 + 4

// 24 -> 1, 24 -> 2, 12 -> 3, 8 -> 4, 6
