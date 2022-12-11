import Foundation

func solution(_ topping: [Int]) -> Int {
    var topping1 = Set<Int>()
    var topping2 = Set(topping)
    var arr = Array(repeating: 0, count: topping.max()! + 1)
    var result = 0

    for x in 0..<topping.count {
        let t = topping[x]
        arr[t] += 1
    }

    for index in 0..<topping.count-1 {
        let t = topping[index]
        topping1.insert(t)
        arr[t] -= 1
        
        if arr[t] == 0 {
            topping2.remove(t)
        }
        
        if topping1.count == topping2.count {
            result += 1
        }
    }
    
    return result
}

