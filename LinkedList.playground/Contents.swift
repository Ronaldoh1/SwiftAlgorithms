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