import Foundation

struct Stack<T> {
    private var elements = [T]()
    
    public init() {}
    
    public mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func peek() -> T? {
        return self.elements.last
    }
    
    public mutating func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
}
