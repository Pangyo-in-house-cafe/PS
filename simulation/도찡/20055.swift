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
var K = 0
var belt = [Int]()
var robots = [Bool]()

func solve() {
    let input = readInt()
    N = input[0]
    K = input[1]
    belt = readInt()
    robots = [Bool](repeating: false, count: N)

    var count = 0
    var beltBase = 0
    var robotBase = 0
    var ans = 0

    while count < K {
        ans += 1
        beltBase = (beltBase + 2*N - 1) % (2 * N)
        robotBase = (robotBase + N - 1) % N
        robots[(robotBase + N - 1) % N] = false

        for i in (0...N-2).reversed() {
            if !robots[(robotBase + i) % N] { continue } // 현재 위치에 로봇이 없음
            if robots[(robotBase + i + 1) % N] || belt[(beltBase + i + 1) % (2 * N)] < 1 { continue } // 로봇을 옮길수 없음

            robots[(robotBase + i + 1) % N] = true
            robots[(robotBase + i) % N] = false
            belt[(beltBase + i + 1) % (2 * N)] -= 1
            if belt[(beltBase + i + 1) % (2 * N)] == 0 { count += 1 }
            robots[(robotBase + N - 1) % N] = false
        }

        if belt[beltBase] > 0 {
            belt[beltBase] -= 1
            robots[robotBase] = true
            if belt[beltBase] == 0 { count += 1 }
        }
    }

    print(ans)
}
