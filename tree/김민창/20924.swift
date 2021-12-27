//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let nr = readLine()!.split(separator: " ").map { Int($0)! }
    var tree = Array(repeating: [(Int, Int)](), count: nr[0] + 1)
    var visited = Array(repeating: false, count: nr[0] + 1)
    var pillar = 0
    var branch = 0
    
    for _ in 0..<(nr[0] - 1) {
        let x = readLine()!.split(separator: " ").map { Int($0)! }
        tree[x[0]].append((x[1], x[2]))
        tree[x[1]].append((x[0], x[2]))
    }
    
    func dfs(_ node: Int, _ depth: Int, _ isBranch: Bool) {
        if tree[node].count ==  1 {
            if !isBranch {
                pillar = depth
            } else {
                branch = max(branch, depth)
            }
        }
        var tempDepth = depth
        var b: Bool = isBranch
        if !isBranch {
            b = tree[node].count > 2 || (depth == 0 && tree[node].count > 1) ? true : false
            if b {
                pillar = depth
                tempDepth = 0
            }
        }
        
        for n in tree[node] {
            if !visited[n.0] {
                visited[n.0] = true
                dfs(n.0, n.1 + tempDepth, b)
            }
        }
    }
    
    visited[nr[1]] = true
    dfs(nr[1], 0, false)
    
    print("\(pillar) \(branch)")
}

main()
