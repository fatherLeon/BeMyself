//
//  main.swift
//  콜라 문제
//
//  Created by 강민수 on 2022/12/02.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var answer = 0
    var reminderBottle = 0
    var changedBottle = 0
    var cola = n
    
    while cola >= a {
        reminderBottle = cola % a
        changedBottle = cola / a * b
        
        answer += changedBottle
        cola = changedBottle + reminderBottle
    }
    
    return answer
}
