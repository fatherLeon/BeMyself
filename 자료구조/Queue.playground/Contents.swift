import Foundation

public struct Queue<T> {
    private var data = [T]()
    
    init() {}
    
    var count: Int {
        return self.data.count
    }
    
    var capacity: Int {
        get {
            return self.data.capacity
        }
        set {
            self.data.reserveCapacity(newValue)
        }
    }
    
    var isFull: Bool {
        return count == self.data.capacity
    }
    
    var isEmpty: Bool {
        return self.data.isEmpty
    }
    
    mutating func dequeue() -> T? {
        return self.data.removeFirst()
    }
    
    mutating func peek() -> T? {
        return self.data.first
    }
    
    mutating func enqueue(element: T) {
        self.data.append(element)
    }
    
    mutating func clear() {
        self.data = []
        // self.data.removeAll(keepingCapacity: false) //참고사항 TIL 2022.11.19.(토)
    }
}

var q = Queue<Int>()
q.enqueue(element: 100)
q.enqueue(element: 120)
q.enqueue(element: 125)
q.enqueue(element: 135)

let x = q.dequeue()
let y = q.peek()

let z = q.dequeue()

