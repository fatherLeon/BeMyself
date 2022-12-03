import Foundation

func getFoodNum(_ food: [Int]) -> [Int] {
    var foods: [Int] = []
    
    for (index, count) in food.enumerated() {
        if index == 0 {
            continue
        }
        
        if isEven(count) {
            foods.append(count / 2)
        } else {
            foods.append((count - 1) / 2)
        }
    }
    
    return foods
}

func isEven(_ val: Int) -> Bool {
    if val % 2 == 0 {
        return true
    } else {
        return false
    }
}

func getFoodTable(_ foods: [Int]) -> [String] {
    var results: [String] = []
    
    for (foodIndex, foodNum) in foods.enumerated() {
        for _ in 0..<foodNum {
            results.append(String(foodIndex+1))
        }
    }
    
    results.append("0")
    
    for (foodIndex, foodNum) in foods.reversed().enumerated() {
        for _ in 0..<foodNum {
            results.append(String(foods.count-foodIndex))
        }
    }
    
    return results
}

func solution(_ food:[Int]) -> String {
    var foods: [Int] = []
    var results: [String] = []
    
    foods = getFoodNum(food)
    results = getFoodTable(foods)
    
    return results.joined()
}
