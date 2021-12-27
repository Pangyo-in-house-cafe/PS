//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.split(separator: " ").map({Int(String($0))!})}

/*[😈][🔮][🦔]*/

var N = 0
var arr = [[Int]]()

func dfs(r: Int, c: Int, dir: Int) -> Int {
    if r == N-1 && c == N-1 { return 1 }
    
    var ans = 0
    if dir == 0 || dir == 2 { // 가로
        if (0...N-1) ~= c + 1 && arr[r][c+1] == 0 { ans += dfs(r: r, c: c+1, dir: 0) }
    }
    if dir == 1 || dir == 2 { // 세로
        if (0...N-1) ~= r + 1 && arr[r+1][c] == 0 { ans += dfs(r: r+1, c: c, dir: 1) }
    }
    if (0...N-1) ~= r + 1 && (0...N-1) ~= c + 1 {
        if arr[r+1][c] == 0 && arr[r][c+1] == 0 && arr[r+1][c+1] == 0 {
            ans += dfs(r: r+1, c: c+1, dir: 2)
        }
    }
    return ans
}

func solve() {
    N = readInt()[0]
    for _ in 0..<N {
        arr.append(readInt())
    }

    print(dfs(r: 0, c: 1, dir: 0))
}
