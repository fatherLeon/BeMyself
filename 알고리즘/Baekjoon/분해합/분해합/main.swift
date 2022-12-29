//
//  main.swift
//  분해합
//
//  Created by 강민수 on 2022/12/21.
//

import Foundation

extension String {
    subscript(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

let n = readLine()!
let value = Int(n)!
var qwe = true
for x in 0..<value {
    var arr: [Int] = [x]
    
    for index in 0..<String(x).count {
        arr.append(Int(String(x)[index])!)
    }
    
    if arr.reduce(0, +) == value {
        print(x)
        qwe = false
        break
    }
}

if qwe {
    print(0)
}
