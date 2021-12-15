//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

var N = 0
var qu = [Int]()
var front = 0
var count = 1
let INF = 9876543210

func decreasingNumber(_ n: Int) -> Int {
    if n == 0 { return 0 }
    while front < qu.count {
        let first = qu[front]
        let last = first % 10
        front += 1

        if n == count { return first }
        if first == INF { return -1 }

        for i in 0..<last {
            let next = first * 10 + i
            qu.append(next)
        }
        count += 1
    }
    return -1
}

func solve() {
    N = readInt()[0]
    for i in 1...9 {
        qu.append(i)
    }
    print(decreasingNumber(N))
}
