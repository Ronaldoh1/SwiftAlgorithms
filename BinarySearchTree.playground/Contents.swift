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