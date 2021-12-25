//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

let dr = [0, 1, 0, -1]
let dc = [1, 0, -1, 0]
var R = 0, C = 0
var treasureMap = [[Character]]()
var visited = [[Bool]]()

func bfs(_ r: Int, _ c: Int) -> Int {
    var ans = 0
    var qu = [(r: Int, c: Int, lv: Int)]()
    var front = 0
    visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)

    visited[r][c] = true
    qu.append((r, c, 0))
    while front < qu.count {
        let current = qu[front]
        front += 1
        ans = max(ans, current.lv)

        for i in 0..<4 {
            let nr = current.r + dr[i]
            let nc = current.c + dc[i]
            if !((0...R-1) ~= nr && (0...C-1) ~= nc) { continue }
            if visited[nr][nc] || treasureMap[nr][nc] == "W" { continue }

            visited[nr][nc] = true
            qu.append((nr, nc, current.lv + 1))
        }
    }
    return ans
}

func solve() {
    let input = readInt()
    R = input[0]
    C = input[1]

    for _ in 0..<R {
        treasureMap.append(Array(readStr()[0]))
    }

    var ans = 0
    for r in 0..<R {
        for c in 0..<C {
            if treasureMap[r][c] == "W" { continue }
            ans = max(ans, bfs(r, c))
        }
    }

    print(ans)
}
