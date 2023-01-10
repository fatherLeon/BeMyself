//
//  main.swift
//  풍선 터뜨리기
//
//  Created by 강민수 on 2023/01/10.
//

import Foundation

class Node {
    let data: Int
    let number: Int
    
    var next: Node?
    var prev: Node?
    
    init(data: Int, number: Int, next: Node? = nil, prev: Node? = nil) {
        self.data = data
        self.number = number
        self.next = next
        self.prev = prev
    }
}

struct LinkedList {
    var head: Node?
    var tail: Node?
    
    init(values: [Int]) {
        var arr = values
        let value = arr.removeFirst()
        var count = 1
        var currentNode = Node(data: value, number: count)
        
        self.head = currentNode
        
        for val in arr {
            count += 1
            
            let node = Node(data: val, number: count)
            currentNode.next = node
            node.prev = currentNode
            currentNode = node
        }
        
        self.tail = currentNode
        self.tail?.next = self.head
        self.head?.prev = self.tail
    }
    
    mutating func pop() -> Node? {
        let nowHead = self.head
        
        self.head = self.head?.next
        self.head?.prev = self.tail
        
        self.tail?.next = self.head
        
        return nowHead
    }
    
    mutating func moveToRight(_ num: Int) {
        for _ in 0..<num-1 {
            self.head = self.head?.next
            self.tail = self.tail?.next
        }
    }
    
    mutating func moveToLeft(_ num: Int) {
        for _ in 0..<num {
            self.tail = self.tail?.prev
            self.head = self.head?.prev
        }
    }
    
    func printLinkedList() {
        var nowNode = self.head
        print("-----------head-----------")
        repeat {
            print("\(nowNode?.data) - \(nowNode?.number)")
            nowNode = nowNode?.next
        } while nowNode !== self.head
        print("-----------tail-----------")
    }
}

let n = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map{ Int($0)! }
var result: [Int] = []
var answer = ""

var linkedList = LinkedList(values: list)

for z in 0..<n {
//    print(z)
//    linkedList.printLinkedList()
    guard let node = linkedList.pop() else { break }
    
    result.append(node.number)
    
//    print("*********Before Move***********")
//    linkedList.printLinkedList()
    
    if node.data > 0 {
        linkedList.moveToRight(node.data)
    } else {
        linkedList.moveToLeft(abs(node.data))
    }
    
//    print("*********After Move***********")
//    linkedList.printLinkedList()
}

answer = result.description.trimmingCharacters(in: ["[", "]"])
print(answer.replacingOccurrences(of: ", ", with: " "))
