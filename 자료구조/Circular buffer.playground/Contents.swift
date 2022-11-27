import Foundation

private struct Constants {
    fileprivate static let defaultBufferCapacity: Int = 16
}

public enum CircularBufferOperation {
    case Ignore, Overwrite
}

struct CircularBuffer<T> {
    fileprivate var data: [T]
    fileprivate var head: Int = 0, tail: Int = 0
    
    private var internalCount: Int = 0
    public var count: Int {
        return self.internalCount
    }
    
    private var overwriteOperation: CircularBufferOperation = .Overwrite
    
    public init() {
        self.data = [T]()
        self.data.reserveCapacity(Constants.defaultBufferCapacity)
    }
    
    public init(_ count: Int, overwriteOperation: CircularBufferOperation = .Overwrite) {
        var capacity = count
        
        if capacity < 1 {
            capacity = Constants.defaultBufferCapacity
        }
        
        //count가 2의 거듭제곱이 아닌 경우 가장 가까운 수를 거듭제곱해서 할당 해줌
        if ((capacity & (~capacity + 1)) != capacity) {
            var binary = 1
            while (binary < capacity) {
                binary = binary << 1
            }
            
            capacity = binary
        }
        
        self.data = [T]()
        self.data.reserveCapacity(capacity)
        self.overwriteOperation = overwriteOperation
    }
    
    public func isEmpty() -> Bool {
        return (self.count < 1)
    }
    
    public mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        
        let el = self.data[head]
        head = incrementPointer(pointer: head)
        internalCount -= 1
        
        return el
    }
    
    public func isFull() -> Bool {
        return self.count == self.data.capacity
    }
    
    fileprivate func incrementPointer(pointer: Int) -> Int {
        return (pointer + 1) & (self.data.capacity - 1)
    }
    
    fileprivate func decrementPointer(pointer: Int) -> Int {
        return (pointer - 1) & (self.data.capacity - 1)
    }
    
    public func peek() -> T? {
        if isEmpty() {
            return nil
        }
        
        return self.data[head]
    }
    
    public mutating func push(element: T) {
        if isFull() {
            switch overwriteOperation {
            case .Ignore: return
            case .Overwrite: pop()
            }
        }
        
        if self.data.endIndex < self.data.capacity {
            self.data.append(element)
        } else {
            self.data[tail] = element
        }
        
        self.tail = incrementPointer(pointer: tail)
        self.internalCount += 1
    }
    
    public var capacity: Int {
        get {
            return self.data.capacity
        } set {
            self.data.reserveCapacity(newValue)
        }
    }
}
