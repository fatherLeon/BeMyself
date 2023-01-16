//
//  main.swift
//  에디터
//
//  Created by 강민수 on 2023/01/11.
//
import Foundation

final class Node {
    let data: String

    var prev: Node?
    var next: Node?

    init(data: String, prev: Node? = nil, next: Node? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

final class Cusor {
    var prevNode: Node?
    var nextNode: Node?

    init(prevNode: Node? = nil, nextNode: Node? = nil) {
        self.prevNode = prevNode
        self.nextNode = nextNode
    }
}

struct Editor {
    var head: Node?
    var tail: Node?
    var cusor: Cusor = Cusor()

    init(_ text: [String]) {
        var arr = text
        let firstValue = arr.removeFirst()
        var currentNode = Node(data: firstValue)

        self.head = currentNode

        for val in arr {
            let node = Node(data: val)

            node.prev = currentNode
            node.next = nil
            currentNode.next = node

            currentNode = node
        }

        self.tail = currentNode
        self.cusor = Cusor(prevNode: self.tail)
    }

    mutating func moveToLeft() {
        if self.cusor.prevNode == nil { return }

        let nowPrevNode = self.cusor.prevNode

        self.cusor.nextNode = nowPrevNode
        self.cusor.prevNode = nowPrevNode?.prev
    }

    mutating func moveToRight() {
        if self.cusor.nextNode == nil { return }

        let nowNextNode = self.cusor.nextNode

        self.cusor.prevNode = nowNextNode
        self.cusor.nextNode = nowNextNode?.next
    }

    mutating func removeData() {
        if self.cusor.prevNode == nil { return }

        _ = self.cusor.prevNode
        let nowNextNode = self.cusor.nextNode

        let willPrevNode = self.cusor.prevNode?.prev

        willPrevNode?.next = nowNextNode
        nowNextNode?.prev = willPrevNode

        cusor.prevNode = willPrevNode

        if nowNextNode?.prev == nil {
            self.head = nowNextNode
        }
    }

    mutating func append(data: String) {
        let node = Node(data: data)

        if self.cusor.prevNode == nil {
            // 헤드 앞에 추가해야할때
            let nextNode = self.cusor.nextNode

            node.next = nextNode
            nextNode?.prev = node

            self.head = node
            self.cusor.prevNode = self.head

            return
        } else if self.cusor.nextNode == nil {
            // tail에 추가해야할 때
            let prevNode = self.cusor.prevNode

            prevNode?.next = node
            node.prev = prevNode

            self.tail = node
            self.cusor.prevNode = node

            return
        } else {

            let prevNode = self.cusor.prevNode
            let nextNode = self.cusor.nextNode

            prevNode?.next = node
            node.prev = prevNode

            nextNode?.prev = node
            node.next = nextNode

            self.cusor.prevNode = node
        }
    }

    func printAnswer() {
        var answer = ""
        var currentNode = self.head

        while currentNode?.next != nil {
            if let val = currentNode?.data {
                answer += val
            }
            currentNode = currentNode?.next
        }

        answer += currentNode!.data

        print(answer)
    }
}

let text = readLine()!
var editor = Editor(Array(text).map{ String($0) })
let n = Int(readLine()!)!

for _ in 0..<n {
    let commands = readLine()!.split(separator: " ").map { String($0) }

    switch commands[0] {
    case "L":
        editor.moveToLeft()
    case "D":
        editor.moveToRight()
    case "B":
        editor.removeData()
    default:
        editor.append(data: commands[1])
    }
}

editor.printAnswer()
