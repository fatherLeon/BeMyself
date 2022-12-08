//
//  main.swift
//  가장 가까운 같은 글자
//
//  Created by 강민수 on 2022/12/08.
//

import Foundation

let s = "banana"

func solution(_ s: String) -> [Int] {
    var word: [String: Int] = [:]
    var result: [Int] = []

    for (index, val) in Array(s).map { String($0) }.enumerated() {
        if let beforeIndex = word[val] {
            result.append(index - beforeIndex)
        } else {
            result.append(-1)
        }
        
        word[val] = index
    }
    
    return result
}
