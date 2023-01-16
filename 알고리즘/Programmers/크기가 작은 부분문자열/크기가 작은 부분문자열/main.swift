import Foundation

extension String {
    func substring(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        
        return String(self[startIndex...endIndex])
    }
}

func solution(_ t:String, _ p:String) -> Int {
    let value = Int(p)!
    let count = p.count
    var comparedList: [Int] = []
    var answer = 0

    for val in 0...t.count-count {
        comparedList.append(Int(t.substring(from: val, to: val+count-1))!)
    }

    for comparedValue in comparedList {
        if value >= comparedValue {
            answer += 1
        }
    }
    
    return answer
}
