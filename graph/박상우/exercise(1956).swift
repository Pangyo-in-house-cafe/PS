import Foundation

let inputs = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let V = inputs[0]
let E = inputs[1]
var graph = Array(repeating: Array(repeating: 10001, count: V), count: V)
var result = 10001

for _ in (0..<E) {
    let inputs = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    graph[inputs[0]-1][inputs[1]-1] = inputs[2]
}

for k in (0..<V) {
    for i in (0..<V) {
        for j in (0..<V) {
            if graph[i][j] > graph[i][k] + graph[k][j] {
                graph[i][j] = graph[i][k] + graph[k][j]
            }
        }
    }
}

for i in (0..<V) {
    result = min(result, graph[i][i])
}

if result == 10001 {
    print(-1)
} else {
    print(result)
}

