import UIKit

struct Queue<Element> {
    var array: [Element] = []
    
    init() { }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    // not remove
    var peek: Element? {
        return array.first
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        
        return true
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil: array.removeFirst()
    }
}
