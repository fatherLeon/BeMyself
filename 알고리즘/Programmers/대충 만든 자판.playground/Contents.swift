import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result: [Int] = []

    targets.forEach { target in
        let keyResult = getOneTarget(keymap, target)
        result.append(keyResult)
    }

    return result
}

func getOneTarget(_ keymap: [String], _ target: String) -> Int {
    var keymaps = keymap
    var result = 0
    var isHaving = true
    
    target.forEach { char in
        var results: [Int] = []
        keymaps.forEach { keymap in
            let distance = getDistance(keymap, target: char)
            
            if distance != -1 {
                results.append(distance)
            }
        }

        if results.isEmpty {
            result = -1
            isHaving = false
            
            return
        } else {
            result += results.min()!
        }
    }
    
    print(result, isHaving)
    
    if isHaving {
        return result
    } else {
        return -1
    }
}

func getDistance(_ keymap: String, target: Character) -> Int {
    guard let index = keymap.firstIndex(of: target) else { return -1 }
    
    let result = keymap.distance(from: keymap.startIndex, to: index)
    
    return result + 1
}

solution(["ABCE"], ["ABDE"])
