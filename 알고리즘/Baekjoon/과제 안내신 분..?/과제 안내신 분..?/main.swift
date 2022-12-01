//
//  main.swift
//  과제 안내신 분..?
//
//  Created by 강민수 on 2022/12/01.
//

import Foundation

var answer = Array(1...30)

for _ in 0..<28 {
    let submitterNumber = Int(readLine()!)!
    
    answer[submitterNumber-1] = 0
}

for x in answer.filter { $0 != 0 } {
    print(x)
}
