//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.split(separator: " ").map({Int(String($0))!})}

/*[😈][🔮][🦔]*/

var N = 0, R = 0
var adj = [[(next: Int, dist: Int)]]()
var visited = [Bool]()

func dfs(_ n: Int) -> Int {
    var ans = 0
    visited[n] = true
    for edge in adj[n] {
        if visited[edge.next] { continue }
        ans = max(ans, dfs(edge.next) + edge.dist)
    }
    return ans
}

func solve() {
    var input = readInt()
    N = input[0]
    R = input[1]
    visited = [Bool](repeating: false, count: N+1)
    adj = [[(next: Int, dist: Int)]](repeating: [(next: Int, dist: Int)](), count: N+1)
    for _ in 0..<N-1 {
        input = readInt()
        adj[input[0]].append((input[1], input[2]))
        adj[input[1]].append((input[0], input[2]))
    }

    var giga = R
    var sum = 0
    if adj[R].count == 1 {
        while true {
            if adj[giga].count > 2 { break }
            visited[giga] = true
            let pre = giga
            for edge in adj[giga] {
                if visited[edge.next] { continue }
                giga = edge.next
                sum += edge.dist
            }
            if pre == giga { break }
        }
    }

    print("\(sum) \(dfs(giga))")
}
