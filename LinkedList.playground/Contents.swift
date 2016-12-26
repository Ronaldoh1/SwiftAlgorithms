//: Implementation of LinkedList


import UIKit


public class LinkedListNode<T> {

    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?

    init(value: T) {
        self.value = value
    }

}


public class LinkList<T> {
    public typealias Node = LinkedListNode<T>

    public var head: Node?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node? {
        return head
    }
}