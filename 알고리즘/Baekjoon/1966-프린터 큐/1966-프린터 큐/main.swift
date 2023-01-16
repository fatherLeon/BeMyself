//
//  main.swift
//  1966-프린터 큐
//
//  Created by 강민수 on 2023/01/17.
//

import Foundation

struct Queue {
    private var data: [Int] = []  // 중요도: 순서
    var head = 0
    var answer = 1
    var maxValue: Int {
        return self.data.max()!
    }
    
    init(arr: [Int]) {
        for val in arr {
            self.data.append(val)
        }
    }
    
    mutating func enqueue(_ value: Int) {
        self.data.append(value)
    }
    
    mutating func dequeue() {
        self.data.removeFirst()
    }
    
    mutating func action(_ targetNum: Int) -> Int {
        var target = targetNum
        
        while target < self.data.count {
            if target == 0 {
                if isMax() {
                    return answer
                } else {
                    self.data.append(self.data[0])
                    dequeue()
                    target = self.data.count - 1
                }
            } else {
                if isMax() {
                    dequeue()
                    target -= 1
                    answer += 1
                } else {
                    self.data.append(self.data[0])
                    dequeue()
                    target -= 1
                }
            }
        }
        return answer
    }
    
    func isMax() -> Bool {
        if self.data[head] >= self.maxValue {
            return true
        } else {
            return false
        }
    }
}

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let numberOfPaper = info[0]
    let targetNumber = info[1]
    
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var queue = Queue(arr: arr)
    
    print(queue.action(targetNumber))
}
