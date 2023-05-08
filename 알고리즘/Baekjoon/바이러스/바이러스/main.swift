import Foundation

protocol Graph {
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double) {
        
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

enum EdgeType {
    case directed
    case undirected
}

struct Vertex<T> {
    let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

class AdjacencyList<T: Hashable>: Graph {
    private var adjancencies: [Vertex<T>: [Edge<T>]] = [:]
    
    @discardableResult
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        
        if adjancencies[vertex] != nil {
            return vertex
        } else {
            adjancencies[vertex] = []
            return vertex
        }
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjancencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjancencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).first { $0.destination == destination }?.weight
    }
    
    func BFS(start: T) -> Int {
        var visitedQueue: [Vertex<T>] = []
        var needVisitQueue: [Vertex<T>] = [createVertex(data: start)]
        
        while !needVisitQueue.isEmpty {
            let node = needVisitQueue.removeFirst()
            
            if visitedQueue.contains(node) { continue }
            visitedQueue.append(node)
            guard let edges = adjancencies[node] else { continue }
            
            let destinations = edges.map { $0.destination }
            
            needVisitQueue += destinations
        }
        
        return visitedQueue.count
    }
    
    typealias Element = T
}

let computers = Int(readLine()!)!
let nodeCount = Int(readLine()!)!

let network = AdjacencyList<Int>()

for _ in 0..<nodeCount {
    let pair = readLine()!.split(separator: " ").map { Int($0) }

    let sourceValue = pair[0]!
    let destinationValue = pair[1]!

    let source = network.createVertex(data: sourceValue)
    let destination = network.createVertex(data: destinationValue)

    network.addUndirectedEdge(between: source, and: destination, weight: 0)
}

print(network.BFS(start: 1) - 1)

// [Int: [Int]]
// compactMap

