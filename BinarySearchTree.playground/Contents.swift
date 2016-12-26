//: Implementation of Binary Search Tree 

public class BinarySearchTree<T> {
    private(set) public var parent: BinarySearchTree?
    private(set) public var leftChild: BinarySearchTree?
    private(set) public var rightChild: BinarySearchTree?
    private(set) public var value: T?

    //need an initializer

    init(value: T) {
        self.value = value
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
    
}