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

    public var last: Node? {
        if var node = head {
            while case let  next? = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }

    public func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }

    public var count: Int {
        if var node = head {
            var c = 1
            while case let next? = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }

    public func nodeAt(_ index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node?.next
            }
        }
        return nil
    }

    private func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        assert(index >= 0)

        var i = index
        var next = head
        var prev: Node?

        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next!.next
        }
        assert(i == 0)

        return (prev, next)
    }

    // inserting nodes

    public func insert(value: T, atIndex index: Int) {
        let (prev, next) = nodesBeforeAndAfter(index: index)

        let newNode = Node(value: value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode

        if prev == nil {
            head = newNode
        }

    }

    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        node.previous = nil
        node.next = nil
        return node.value
    }

}