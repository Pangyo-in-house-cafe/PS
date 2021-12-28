//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

public struct PriorityQueue<T: Comparable> {
    private var heap = [T]()
    private let ordered: (T, T) -> Bool
    public init() {
        ordered = { $0 < $1 }
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    public mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        let temp = heap.removeLast()
        return temp
    }
    
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index-1)/2], heap[index]) {
            heap.swapAt((index-1)/2, index)
            index = (index-1)/2
        }
    }
}

struct Node: Comparable {
    let cost: Int
    let index: Int
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
}

func main() {
    let ve = readLine()!.split(separator: " ").map({Int(String($0))!})
    let k = Int(readLine()!)!
    
    var graph = Array(repeating: [(Int, Int)](), count: ve[0] + 1)
    
    for _ in 0..<ve[1] {
        let uvw = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[uvw[0]].append((uvw[1], uvw[2]))
    }
    
    var distance = Array(repeating: Int.max, count: ve[0] + 1)
    var pq = PriorityQueue<Node>()
    pq.push(Node(cost: 0, index: k))
    
    distance[k] = 0
    
    while !pq.isEmpty {
        let node = pq.pop()!
        if distance[node.index] < node.cost { continue }
        
        for i in graph[node.index] {
            let d = i.1 + node.cost
            if distance[i.0] > d {
                distance[i.0] = d
                pq.push(Node(cost: d, index: i.0))
            }
        }
    }
    
    for i in distance[1...] {
        if i == Int.max { print("INF") }
        else { print(i) }
    }
}

main()
