import Foundation

func solution(_ ingredient: [Int]) -> Int {
    let hambuger = [1, 2, 3, 1]
    var ingredients: [Int] = []
    var result = 0

    for i in ingredient {
        ingredients.append(i)
        
        if ingredients.count < 4 { continue }
        
        let count = ingredients.count
        
        if Array(ingredients[count-4..<count]) == hambuger {
            result += 1
            ingredients = Array(ingredients[0..<count-4])
        }
    }
    
    return result
}
