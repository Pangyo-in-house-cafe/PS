import Foundation

let inputs = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let V = inputs[0]
let E = inputs[1]
let K = Int(readLine()!)!
var graphs: [Int: [(Int, Int)]] = [:]
var shortestWay: [Int] = Array(repeating: Int.max, count: V)
var queue = [(K, 0)]

shortestWay[K-1] = 0

for _ in (0..<E) {
    let inputs = readLine()!.components(separatedBy: " ").map { Int($0)! }
    if let _ = graphs[inputs[0]] {
        graphs[inputs[0]]!.append((inputs[1], inputs[2]))
    } else {
        graphs[inputs[0]] = [(inputs[1], inputs[2])]
    }
}

while queue.count > 0 {
    let value = queue.removeFirst()
    if let ways = graphs[value.0] {
        for graph in ways {
            if graph.1 + value.1 < shortestWay[graph.0 - 1] {
                shortestWay[graph.0 - 1] = graph.1 + value.1
                queue.append((graph.0, graph.1 + value.1))
            } else {
                continue
            }
        }
    }
}

for i in (0..<V) {
    if shortestWay[i] != Int.max {
        print(shortestWay[i])
    } else {
        print("INF")
    }
}
