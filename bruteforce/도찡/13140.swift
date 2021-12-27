//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

var N = 0
var number = [Int](repeating: 0, count: 7)
var visited = [Bool](repeating: false, count: 10)
let helloIndex = [0, 1, 2, 2, 3]
let worldIndex = [4, 3, 5, 2, 6]

func isAnswer() -> Bool {
    var hello = 0, world = 0
    for i in 0..<5 {
        hello = hello * 10 + number[helloIndex[i]]
        world = world * 10 + number[worldIndex[i]]
    }
    if hello + world == N {
        printAnswer(hello: hello, world: world)
        return true
    }
    return false
}

func printAnswer(hello: Int, world: Int) {
    var answer = String(N)
    if Int(log10(Float(N))) + 1 == 5 { answer = " " + answer }
    print("  \(hello)")
    print("+ \(world)")
    print("-------")
    print(" \(answer)")
}

func dfs(_ pos: Int) {
    if pos >= 7 {
        if isAnswer() { exit(0) }
        return
    }

    for i in 0...9 {
        if visited[i] { continue }
        if i == 0 && (pos == 0 || pos == 4) { continue }
        number[pos] = i
        visited[i] = true
        dfs(pos+1)
        visited[i] = false
    }
}

func solve() {
    N = readInt()[0]
    if N < 20000 || N > 199990 { print("No Answer"); return }
    dfs(0)
    print("No Answer")
}
