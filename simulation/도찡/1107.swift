//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

var N = 0, M = 0, digit = 0
var button = [Int]()
var ans = 500000

/*[😈][🔮][🦔]*/

func dfs(pre: Int, pos: Int) {
    ans = min(ans, abs(N - pre) + pos - 1)
    if pos > digit + 1 { return }

    for i in button {
        dfs(pre: pre * 10 + i, pos: pos + 1)
    }
}

func solve() {
    N = readInt()[0]
    M = readInt()[0]
    if N == 0 { digit = 1 }
    else { digit = Int(log10(Float(N))) + 1 }

    for i in 0...9 { button.append(i) }
    if M > 0 {
        let input = readInt()
        button = button.filter { !input.contains($0) }
    }

    ans = abs(N - 100)
    for i in button {
        dfs(pre: i, pos: 2)
    }
    print(ans)
}
