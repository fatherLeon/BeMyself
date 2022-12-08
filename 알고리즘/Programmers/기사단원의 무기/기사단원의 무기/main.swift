import Foundation

func getDivisor(_ val: Int) -> Int {
    var count = 0
    
    if val == 1 {
        count = 1
    } else if val == 2 || val == 3 {
        count = 2
    } else {
        for x in 1...Int(sqrt(Double(val))) {
            if val % x == 0 {
                if (x * x) == val {
                    count += 1
                } else {
                    count += 2
                }
            }
        }
    }
    
    return count
}

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var powerList: [Int] = []
    
    for n in 1...number {
        let p = getDivisor(n)
        
        if p > limit {
            powerList.append(power)
        } else {
            powerList.append(p)
        }
    }
    
    return powerList.reduce(0) { $0 + $1 }
}
