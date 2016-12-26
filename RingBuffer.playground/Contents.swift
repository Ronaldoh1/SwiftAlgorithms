//: Implementation for Ring Buffer
import UIKit

public struct RingBuffer<T> {
    fileprivate var array: [T?]
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0

    //initialize the array with specific count
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }

    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }

    }

    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
           return nil
        }
    }

    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }

    fileprivate var availableSpaceForWriting: Int {
        return array.count - writeIndex
    }

    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }

    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }

}