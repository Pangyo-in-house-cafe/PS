import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    var isEmpty: Bool {
        return nodes.isEmpty
    }

    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    func peek() -> T? {
        return nodes.first
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func delete() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        let result = nodes.first

        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()
        var index = 0
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                }
                else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
        return result
    }
}

struct Edge: Comparable {
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.cost < rhs.cost
    }
    
    
    var node: Int
    var cost: Int
}

func solve() {
    let vAndE = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let v = vAndE[0]
    let e = vAndE[1]

    let k = Int(readLine()!)! - 1

    let INF = Int.max
    var relation = Array(repeating: [(Int,Int)]() , count: v)
    var distance = Array(repeating: INF, count: v)
    
    distance[k] = 0

    for _ in 0..<e {
        let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
        relation[line[0] - 1].append((line[1] - 1, line[2]))
    }

    var heap = Heap<Edge>(comparer: >)
    heap.insert(Edge(node: k, cost: 0))

    while !heap.isEmpty {
        let now = heap.delete()!

        if distance[now.node] < now.cost {
            continue
        }

        for next in relation[now.node] {
            if now.cost + next.1 < distance[next.0] {
                distance[next.0] = now.cost + next.1
                heap.insert(Edge(node: next.0, cost: now.cost + next.1))
            }
        }
    }

    var answer = ""

    for i in 0...v - 1 {
        if distance[i] == INF {
            answer += "INF"
        }
        else {
            answer += "\(distance[i])"
        }
        if i != v - 1 {
            answer += "\n"
        }
    }

    print(answer)
}

solve()


