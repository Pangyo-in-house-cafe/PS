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
var L = 0
var road = [[Int]](repeating: [Int](), count: 102)

func isMovable(row: Int, col: Int) -> Bool {
    var r = row
    var c = col
    var dr = 0
    var dc = 0

    if row == -1 { // 세로 방향
        r = 0
        dr = 1
    } else { // 가로 방향
        c = 0
        dc = 1
    }

    var count = 0
    while r + dr < N && c + dc < N {
        count += 1
        if road[r][c] == road[r+dr][c+dc] - 1 { // 올라가는 경우
            if count < L { return false }
            count = 0
        }
        else if road[r][c] == road[r+dr][c+dc] + 1 { // 내려가는 경우
            if r + L * dr >= N || c + L * dc >= N { return false }
            for i in 1...L {
                if road[r][c] != road[r + i*dr][c + i*dc] + 1 { return false }
            }
            count = -1
            r += dr * (L-1)
            c += dc * (L-1)
        }
        else if road[r][c] != road[r+dr][c+dc] { return false }
        r += dr; c += dc
    }

    return true
}

func solve() {
    let input = readInt()
    N = input[0]
    L = input[1]

    for i in 0..<N {
        road[i] = readInt()
    }

    var ans = 0
    for i in 0..<N {
        if isMovable(row: i, col: -1) { ans += 1 }
        if isMovable(row: -1, col: i) { ans += 1 }
    }

    print(ans)
}
