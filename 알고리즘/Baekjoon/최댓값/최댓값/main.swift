//
//  main.swift
//  최댓값
//
//  Created by 강민수 on 2022/11/30.
//

import Foundation

var array: [[Int]] = []
var maxValue = 0
var location = [0, 0]

for _ in 0..<9 {
    var temp = readLine()!.split(separator: " ").map { Int($0)! }
    array.append(temp)
}

for (num, arr) in array.enumerated() {
    if arr.max()! > maxValue {
        maxValue = arr.max()!
        location[0] = num
        location[1] = arr.firstIndex(of: arr.max()!)!
    }
}

print(maxValue)
print(location[0] + 1, location[1] + 1)
