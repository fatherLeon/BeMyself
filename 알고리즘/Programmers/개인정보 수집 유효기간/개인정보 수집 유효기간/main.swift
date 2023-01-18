//
//  main.swift
//  개인정보 수집 유효기간
//
//  Created by 강민수 on 2023/01/17.
//

import Foundation

struct Calendar {
    var year: Int
    var month: Int
    var days: Int
    
    mutating func addMonths(_ months: Int) {
        
        let overYear = months / 12
        let overMonth = months % 12

        self.year += overYear
        self.month += overMonth
        
        if self.month > 12 {
            self.year += 1
            self.month -= 12
        }
    }
}

func makeCalendar(today: String) -> Calendar {
    let list = today.split(separator: ".").map{ Int($0)! }
    
    return Calendar(year: list[0], month: list[1], days: list[2])
}

func makePrivacy(info: String) -> (Calendar, String) {
    let infoList = info.split(separator: ".").map { String($0) }
    let year = infoList[0]
    let month = infoList[1]
    
    let value = infoList[2].split(separator: " ").map { String($0) }

    return (Calendar(year: Int(year)!, month: Int(month)!, days: Int(value[0])!), value[1])
}

func compareCalendar(today: Calendar, compared: Calendar) -> Bool {
    if today.year > compared.year {
        return true
    } else if today.year == compared.year {
        if today.month > compared.month {
            return true
        } else if today.month == compared.month {
            if today.days >= compared.days {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    } else {
        return false
    }
}

let today = "2020.01.01"
let terms = ["Z 3", "D 12"]
let privacies =  ["2019.12.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]
//------------------------------
var term: [String: Int] = [:]

for t in terms {
    let arr = t.split(separator: " ").map{ String($0) }
    
    term[arr[0]] = Int(arr[1])
}

var todayDate = makeCalendar(today: today)
var count = 0
var answer: [Int] = []

for pri in privacies {
    var (calendar, type) = makePrivacy(info: pri)
    
    guard let typeMonth = term[type] else { break }
    
    calendar.addMonths(typeMonth)
    print(today, calendar)
    if compareCalendar(today: todayDate, compared: calendar) {
        answer.append(count+1)
    }
    count += 1
}

print(answer)
