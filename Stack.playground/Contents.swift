// Implementatio of a Stack

public struct Stack<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    public mutating func pop(_ element: T) {
        array.popLast()
    }

    public mutating func peek() -> T? {
        return array.last
    }
    
}
