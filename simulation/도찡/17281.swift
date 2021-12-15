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
var order = [Int](repeating: 0, count: 10)
var arr = [[Int]]()
var check = [Bool](repeating: false, count: 10)
var ans = 0

func play() -> Int {
    var ining = 0
    var i = 1
    var current = order[1]
    var score = 0
    var outCount = 0
    var ru = [false, false, false, false]

    while ining < N {
        switch arr[ining][current-1] {
        case 0 :
            outCount += 1
        case 1:
            if ru[3] { score += 1; ru[3] = false }
            if ru[2] { ru[3] = true; ru[2] = false }
            if ru[1] { ru[2] = true }
            ru[1] = true
        case 2:
            if ru[3] { score += 1; ru[3] = false }
            if ru[2] { score += 1; ru[2] = false }
            if ru[1] { ru[3] = true; ru[1] = false }
            ru[2] = true
        case 3:
            if ru[3] { score += 1; ru[3] = false }
            if ru[2] { score += 1; ru[2] = false }
            if ru[1] { score += 1; ru[1] = false }
            ru[3] = true
        default:
            if ru[3] { score += 1; ru[3] = false }
            if ru[2] { score += 1; ru[2] = false }
            if ru[1] { score += 1; ru[1] = false }
            score += 1;
        }

        if outCount == 3 {
            ining += 1
            outCount = 0
            ru[1] = false; ru[2] = false; ru[3] = false;
        }

        if i == 9 { i = 1 }
        else { i += 1 }

        current = order[i]
    }

    return score
}

func dfs(_ n: Int) {
    if n == 10 {
        ans = max(ans, play())
        return
    }

    for i in 2..<10 {
        if check[i] { continue }
        check[i] = true
        order[n] = i

        if n == 3 { dfs(n+2) }
        else { dfs(n+1) }

        check[i] = false
        order[n] = 0
    }
}

func solve() {
    N = readInt()[0]
    for _ in 0..<N {
        arr.append(readInt())
    }

    order[4] = 1
    dfs(1)
    print(ans)
}
