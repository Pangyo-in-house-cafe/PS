//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.split(separator: " ").map({Int(String($0))!})}

/*[😈][🔮][🦔]*/

class PriorityQueue<T: Comparable> {
    private var queue = [T]()
    var isEmpty: Bool { return queue.isEmpty }

    func front() -> T {
        return queue.first!
    }

    func push(_ value: T) {
        queue.append(value)
        var index = queue.count - 1

        while index > 0 {
            if queue[(index-1)/2] <= queue[index] { break }
            queue.swapAt((index-1) / 2, index)
            index = (index-1) / 2
        }
    }

    @discardableResult
    func pop() -> T {
        if queue.count == 1 { return queue.removeFirst() }

        let ret = queue[0]
        queue[0] = queue.removeLast()
        var index = 0

        while 2 * index + 1 < queue.count {
            var child = 2 * index + 1
            if child + 1 < queue.count && queue[child + 1] < queue[child] { child += 1 }
            if queue[child] < queue[index] {
                queue.swapAt(index, child)
                index = child
            }
            else { break }
        }
        return ret
    }
}

struct Edge: Comparable {
    let cost: Int
    let next: Int
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func solve() {
    let INF = 3000001
    var input = readInt()
    let V = input[0]
    let E = input[1]
    let K = readInt()[0]
    var adj = [[Edge]](repeating: [Edge](), count: V+2)
    var dist = [Int](repeating: INF, count: V+2)
    for _ in 0..<E {
        input = readInt()
        adj[input[0]].append(Edge(cost: input[2], next: input[1]))
    }

    let queue = PriorityQueue<Edge>()
    queue.push(Edge(cost: 0, next: K))
    dist[K] = 0

    while !queue.isEmpty {
        let current = queue.front().next
        let cost = queue.front().cost
        queue.pop()

        for edge in adj[current] {
            if dist[edge.next] <= cost + edge.cost { continue }
            dist[edge.next] = cost + edge.cost
            queue.push(Edge(cost: dist[edge.next], next: edge.next))
        }
    }

    for i in 1...V {
        if dist[i] == INF { print("INF") }
        else { print(dist[i]) }
    }
}
