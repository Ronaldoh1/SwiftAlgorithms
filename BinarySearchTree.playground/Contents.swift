//: Implementation of Binary Search Tree 

public class BinarySearchTree<T: Comparable> {
    private(set) public var parent: BinarySearchTree?
    private(set) public var leftChild: BinarySearchTree?
    private(set) public var rightChild: BinarySearchTree?
    private(set) public var value: T

    //need an initializer

    init(value: T) {
        self.value = value
    }

    // convinience initializer to add elements in an array to a tree. 

    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for value in array.dropFirst() {
            self.insert(value: value, parent: self)
        }
    }

    //is it a root node? 

    public var isRootNode: Bool {
        return parent == nil
    }

    //is it a leaf node? 
    public var isLeafNode: Bool {
        return leftChild == nil && rightChild == nil
    }

    //is it right node 

    public var isRightChildNode: Bool {
        return parent?.rightChild === self
    }

    //is it left node 

    public var isLeftChildNode: Bool {
        return parent?.leftChild === self
    }

    //has right child node 
    public var hasRightChild: Bool {
        return self.rightChild != nil
    }

    //has left child node 
    public var hasLeftChild: Bool {
        return self.leftChild != nil
    }

    // has any childen? 
    public var hasAnyChildren: Bool {
        return hasLeftChild || hasRightChild
    }

    // has both children ?

    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }

    // how many children?

    public var count: Int {
        return (leftChild?.count ?? 00) + 1 + (rightChild?.count ?? 0)
    }


    //Inserting Nodes

    public func insert(_ value: T) {
        insert(value: value, parent: self)
    }

    public func insert(value: T, parent: BinarySearchTree) {
        if value < self.value {
            if let leftChild = self.leftChild {
                leftChild.insert(value: value, parent: leftChild)
            } else {
                leftChild = BinarySearchTree(value: value)
                leftChild?.parent = parent
            }

        } else {
            if let rightChild = self.rightChild {
                rightChild.insert(value: value, parent: rightChild)
            } else {
                rightChild = BinarySearchTree(value: value)
                rightChild?.parent = parent
            }

        }
    }

    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return leftChild?.search(value: value)
        } else if value > self.value {
            return rightChild?.search(value: value)
        } else {
            return self // you found it
        }
    }

    // helper 
    private func reconnectParentToNode(node: BinarySearchTree?) {
        if let parent = parent {
            if hasLeftChild {
                parent.leftChild = node
            } else {
                parent.rightChild = node
            }
        }
        node?.parent = parent
    }

    // finding minimum

    public func minimum() -> BinarySearchTree {
        var node = self
        while case let next? = node.leftChild {
            node = next
        }
        return node
    }

    public func maximum() -> BinarySearchTree {
        var node = self
        while case let next? = node.rightChild {
            node = next
        }
        return node
    }

    public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?

        if let left = leftChild {
            if let right = rightChild {
                replacement = removeNodeWithTwoChildren(left: left, right)  // 1
            } else {
                replacement = left           // 2
            }
        } else if let right = rightChild {    // 3
            replacement = right
        } else {
            replacement = nil              // 4
        }

        reconnectParentToNode(node: replacement)
        
        parent = nil
        leftChild = nil
        rightChild = nil
        
        return replacement
    }

    private func removeNodeWithTwoChildren(left: BinarySearchTree, _ right: BinarySearchTree) -> BinarySearchTree {
        let successor = right.minimum()
        successor.remove()

        successor.leftChild = left
        left.parent = successor

        if right !== successor {
            successor.rightChild = right
            right.parent = successor
        } else {
            successor.rightChild = nil
        }
        
        return successor
    }

    public func successor() -> BinarySearchTree<T>? {
        if let right = rightChild {
            return right.minimum()
        } else {
            var node = self
            while case let parent? = node.parent {
                if parent.value > value { return parent }
                node = parent
            }
            return nil
        }
    }
    public func predecessor() -> BinarySearchTree<T>? {
        if let left = leftChild {
            return left.maximum()
        } else {
            var node = self
            while case let parent? = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil
        }
    }

}


extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = leftChild {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = rightChild {
            s += " -> (\(right.description))"
        }
        return s
    }
}