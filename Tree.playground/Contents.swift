// Simple implementation of Tree 

public class TreeNode<T> {

    public var value: T?

    public weak var parent: TreeNode?

    public var children = [TreeNode<T>]()

    public init(value: T) {
        self.value = value
    }

    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}


extension TreeNode where T: Equatable {

    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }

        for child in children {
            if child.value == value {
                return child
            }
        }
        return nil
    }
}



extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}