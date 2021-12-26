//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

let dr = [0, -1, 0, 1]
let dc = [1, 0, -1, 0]
var R = 0, C = 0, K = 0
var visited = [[Bool]]()

func dfs(_ r: Int, _ c: Int) -> Int {
    var ans = 1
    visited[r][c] = true

    for i in 0..<4 {
        let nr = r + dr[i]
        let nc = c + dc[i]
        if !((0...R-1) ~= nr && (0...C-1) ~= nc) { continue }
        if visited[nr][nc] { continue }
        ans += dfs(nr, nc)
    }

    return ans
}

func solve() {
    var input = readInt()
    R = input[0]
    C = input[1]
    K = input[2]
    visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)

    for _ in 0..<K {
        input = readInt()
        for x in input[0]..<input[2] {
            for y in input[1]+1...input[3] {
                visited[R-y][x] = true
            }
        }
    }

    var ans = [Int]()
    for r in 0..<R {
        for c in 0..<C {
            if !visited[r][c] { ans.append(dfs(r, c)) }
        }
    }

    ans.sort()
    print(ans.count)
    for value in ans {
        print(value, terminator: " ")
    }
}
