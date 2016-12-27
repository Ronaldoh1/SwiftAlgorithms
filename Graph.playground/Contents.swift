// Implementation of a Graph in Swift
import UIKit


public struct Vertex<T>: Equatable where T: Equatable, T: Hashable {

    public var data: T
    public let index: Int
    
}


public struct Edge<T>: Equatable where T: Equatable, T: Hashable {

    public let from: Vertex<T>
    public let to: Vertex<T>

    public let weight: Double?

}

private class EdgeList<T> where T: Equatable, T: Hashable {

    var vertex: Vertex<T>
    var edges: [Edge<T>]? = nil

    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }

    func addEdge(_ edge: Edge<T>) {
        edges?.append(edge)
    }
    
}


for graph in [AdjacencyMatrixGraph<Int>(), AdjacencyListGraph<Int>()] {

    let v1 = graph.createVertex(1)
    let v2 = graph.createVertex(2)
    let v3 = graph.createVertex(3)
    let v4 = graph.createVertex(4)
    let v5 = graph.createVertex(5)

    graph.addDirectedEdge(v1, to: v2, withWeight: 1.0)
    graph.addDirectedEdge(v2, to: v3, withWeight: 1.0)
    graph.addDirectedEdge(v3, to: v4, withWeight: 4.5)
    graph.addDirectedEdge(v4, to: v1, withWeight: 2.8)
    graph.addDirectedEdge(v2, to: v5, withWeight: 3.2)
    
}


//Breath First Search

func breadthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    var queue = Queue<Node>()
    queue.enqueue(source)

    var nodesExplored = [source.label]
    source.visited = true

    while let node = queue.dequeue() {
        for edge in node.neighbors {
            let neighborNode = edge.neighbor
            if !neighborNode.visited {
                queue.enqueue(neighborNode)
                neighborNode.visited = true
                nodesExplored.append(neighborNode.label)
            }
        }
    }
    
    return nodesExplored
}