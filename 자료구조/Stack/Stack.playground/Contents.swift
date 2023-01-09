import UIKit

struct Stack<Element> {
    private var storage: [Element] = []
    
    init() { }
    
    mutating func push(_ element: Element) {
        self.storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "-----top-----\n"
        let bottomDivider = "\n---bottom---"
        
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

// ----------------------------------------------------------------------------------------

extension Array {
    mutating func push(_ element: Element) {
        self.append(element)
    }
    
    mutating func pop() -> Element? {
        return self.popLast()
    }
}

var stack = [1, 2, 3]

stack.push(4)
stack.push(5)

print(stack)

stack.pop()

print(stack)
