//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

var buildings = [Int]()

func isSeeing(from: Int, to: Int, current: Int) -> Bool {
    let lhs = (to - from) * buildings[current]
    let rhs = (buildings[to] - buildings[from]) * (current - to) + (to - from) * buildings[to]
    return lhs < rhs
}

func solve() {
    let N = readInt()[0]
    buildings = readInt()
    var count = [Int](repeating: 0, count: N)

    for i in 0..<N {
        for j in i+1..<N {
            if i+1 > j-1 {
                count[i] += 1; count[j] += 1
                continue
            }
            var flag = true
            for k in i+1...j-1 {
                if isSeeing(from: i, to: j, current: k) { continue }
                flag = false
                break
            }
            if flag { count[i] += 1; count[j] += 1 }
        }
    }

    var ans = 0
    for i in 0..<N {
        ans = max(ans, count[i])
    }
    print(ans)
}
