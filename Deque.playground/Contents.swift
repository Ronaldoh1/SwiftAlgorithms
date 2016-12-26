// Implementing a Deque


public struct Deque<T> {

    public var array = [T]()

    public var isEmpty: Bool {
        return count == 0
    }

    public var count: Int {
        return array.count
    }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    public mutating func enqueueFront(_ element: T) {
        array.insert(element, at: 0)
    }

    public mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }

    public mutating func dequeueBack() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }

    public var peekFront: T? {
        return array.first
    }

    public var peekBack: T? {
        return array.last
    }
    
}
