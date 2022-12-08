//
//  main.swift
//  성격 유형 검사하기
//
//  Created by 강민수 on 2022/12/07.
//

import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func solution(_ survey: [String], _ choices: [Int]) -> String {
    var personalityScore: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0,
                                           "J": 0, "M": 0, "A": 0, "N": 0]
    var score: [Int: Int] = [1: 3, 2: 2, 3: 1, 4: 0,
                             5: 1, 6: 2, 7: 3]
    var result = ""
    
    for (personality, choice) in zip(survey, choices) {
        if choice < 4 {
            personalityScore[personality[0]]! += score[choice]!
        } else {
            personalityScore[personality[1]]! += score[choice]!
        }
    }
    
    for personality in ["RT", "CF", "JM", "AN"] {
        let firstPersonality = personalityScore[personality[0]]!
        let secondPersonality = personalityScore[personality[1]]!
        
        if firstPersonality > secondPersonality {
            result += personality[0]
        } else if secondPersonality > firstPersonality {
            result += personality[1]
        } else {
            if personality[0] > personality[1] {
                result += personality[1]
            } else {
                result += personality[0]
            }
        }
    }
    
    return result
}

