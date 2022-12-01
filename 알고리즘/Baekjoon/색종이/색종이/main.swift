//
//  main.swift
//  색종이
//
//  Created by 강민수 on 2022/12/01.
//

import Foundation

func colorBlackBG(xDistance: Int, yDistance: Int) {
    let xLocation = 99 - xDistance
    
    if xLocation < 0 {
        return
    }
    
    background[xLocation][yDistance] = 1
    
    for x in 0...9 {
        
        for y in 0...9 {
            if y + yDistance > 99 {
                break
            }
            background[xLocation - x][yDistance + y] = 1
        }
    }
}

func calculateArea() -> Int {
    var area = 0
    
    for arr in background {
        area += arr.filter { $0 == 1 }.count
    }
    
    return area
}

var background: [[Int]] = Array(repeating: Array(repeating: 0, count: 100), count: 100)


var count = Int(readLine()!)!

for _ in 0..<count {
    let distance = readLine()!.split(separator: " ").map { Int($0)! }
    colorBlackBG(xDistance: distance[1], yDistance: distance[0])
}

print(calculateArea())
