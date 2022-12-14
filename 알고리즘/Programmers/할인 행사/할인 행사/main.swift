import Foundation

func solution(_ want: [String], _ number: [Int], _ discount: [String]) -> Int {
    
    var shoppingBag: [String: Int] = [:]
    var sumNumber = number.reduce(0, +)
    var result = 0
    
    for (w, n) in zip(want, number) {
        shoppingBag[w] = n
    }
    
    for x in 0...discount.count-sumNumber {
        var cart = shoppingBag
        
        for y in x..<x+10 {
            if y >= discount.count {
                break
            }
            if cart[discount[y]] != nil {
                if cart[discount[y]]! == 0 {
                    continue
                }
                cart[discount[y]]! -= 1
            }
        }
        
        if Array(cart.values).reduce(0, +) == 0 {
            result += 1
        }
    }
    
    return result
}
