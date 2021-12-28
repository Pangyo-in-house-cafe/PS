import Foundation

solve()

func solve() {
    let nAndR = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = nAndR[0]
    let r = nAndR[1] - 1
    
    var edges = [[(Int, Int)]](repeating: [(Int, Int)](), count: n)
    var visited = [Bool](repeating: false, count: n)
    visited[r] = true

    for _ in 0..<n - 1 {
        let aAndBAndD = readLine()!.split(separator: " ").map{ Int($0)! }
        let a = aAndBAndD[0] - 1
        let b = aAndBAndD[1] - 1
        let d = aAndBAndD[2]
        
        edges[a].append((b,d))
        edges[b].append((a,d))
    }
    
    var result = 0
    
    func dfs(_ now: Int, _ length: Int, _ isRoot: Bool, _ isStart: Bool) {
        if isRoot {
            if (!isStart && edges[now].count > 2) || (isStart && edges[now].count > 1) { // 기가 노드
                print(length)
                for next in edges[now] {
                    if !visited[next.0] {
                        visited[next.0] = true
                        dfs(next.0, next.1, false, false)
                        visited[next.0] = false
                    }
                }
            }
            else {
                if (isStart && edges[now].isEmpty) || (!isStart && edges[now].count == 1) {
                    print(length)
                    return
                }
                for next in edges[now] {
                    if !visited[next.0] {
                        visited[next.0] = true
                        dfs(next.0, length + next.1, true, false)
                    }
                }
            }
        } else {
            result = max(result, length)
            for next in edges[now] {
                if !visited[next.0] {
                    visited[next.0] = true
                    dfs(next.0, length + next.1, false, false)
                    visited[next.0] = false
                }
            }
        }
    }
    
    dfs(r, 0, true, true)
    print(result)
}
