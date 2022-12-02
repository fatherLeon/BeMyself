//
//  main.swift
//  삼총사
//
//  Created by 강민수 on 2022/12/01.
//

import Foundation

let number = [-1, 1, -1]
var answer = 0

for x in 0..<number.count {
    for y in x+1..<number.count {
        for z in y+1..<number.count {
            if number[x] + number[y] + number[z] == 0 {
                answer += 1
            }
        }
    }
}

print(answer)
