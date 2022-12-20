//
//  main.swift
//  블랙잭
//
//  Created by 강민수 on 2022/12/19.
//

import Foundation

func permutaionWithRecursion(array: [Int], pickCount: Int, permutationArray: inout [[Int]], index: Int = 0) {
    if index == pickCount {
        permutationArray.append(Array(array[0..<index]))
        return
    }
    
    var arr = array
    
    for i in index..<arr.count {
        arr.swapAt(index, i)
        permutaionWithRecursion(array: arr, pickCount: pickCount, permutationArray: &permutationArray, index: index + 1)
        arr.swapAt(index, i)
    }
}

let nmArr = readLine()!.split(separator: " ")
let n = nmArr[0]
let m = nmArr[1]

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var permutationArr: [[Int]] = []
var maxCardValue = 0

permutaionWithRecursion(array: arr, pickCount: 3, permutationArray: &permutationArr)

for cards in permutationArr {
    let sumValue = cards.reduce(0, +)
    
    if sumValue > maxCardValue && sumValue <= Int(m)! {
        maxCardValue = sumValue
    }
    
    if maxCardValue == Int(m)! {
        break
    }
}

print(maxCardValue)
