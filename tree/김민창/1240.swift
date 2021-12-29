//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

func main() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    var tree = Array(repeating: [(Int, Int)](), count: nm[0] + 1)
    var visited = Array(repeating: false, count: nm[0] + 1)
    
    for _ in 0..<(nm[0] - 1) {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        tree[line[0]].append((line[1], line[2]))
        tree[line[1]].append((line[0], line[2]))
    }
    
    func dfs(_ node: Int, _ end: Int, _ depth: Int) {
        if node == end {
            print(depth)
            return
        }
        
        for i in tree[node] {
            if !visited[i.0] {
                visited[i.0] = true
                dfs(i.0, end, depth + i.1)
                visited[i.0] = false
            }
        }
    }
    
    for _ in 0..<nm[1] {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        visited[line[0]] = true
        dfs(line[0], line[1], 0)
        visited = Array(repeating: false, count: nm[0] + 1)
    }
}

main()
