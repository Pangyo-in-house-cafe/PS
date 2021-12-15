//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

let dr = [-1, 0, 1, 0]
let dc = [0, 1, 0, -1]
let dir = ["N": 0, "E": 1, "S": 2, "W": 3]

var arr = [[Int]](repeating: [Int](repeating: -1, count: 102), count: 102)
var robots = [(r: Int, c: Int, dir: Int)]()
var R = 0
var C = 0
var N = 0
var M = 0

func moveFront(robotIndex: Int, count: Int) {
    var robot = robots[robotIndex]
    arr[robot.r][robot.c] = -1

    for _ in 0..<count {
        let nr = robot.r + dr[robot.dir]
        let nc = robot.c + dc[robot.dir]

        if nr < 0 || nr >= R || nc < 0 || nc >= C {
            print("Robot \(robotIndex+1) crashes into the wall")
            exit(0)
        }
        if arr[nr][nc] >= 0 {
            print("Robot \(robotIndex+1) crashes into robot \(arr[nr][nc]+1)")
            exit(0)
        }

        robot.r = nr
        robot.c = nc
    }
    robots[robotIndex] = robot
    arr[robot.r][robot.c] = robotIndex
}

func order(robotIndex: Int, order: String, count: Int) {
    switch order {
    case "L":
        let dir = robots[robotIndex].dir
        robots[robotIndex].dir = (dir + 3 * count) % 4
    case "R":
        let dir = robots[robotIndex].dir
        robots[robotIndex].dir = (dir + 1 * count) % 4
    case "F":
        moveFront(robotIndex: robotIndex, count: count)
    default: exit(-1)
    }
}

func solve() {
    var input = readInt()
    C = input[0]
    R = input[1]
    input = readInt()
    N = input[0]
    M = input[1]

    for i in 0..<N {
        let input = readStr()
        let r = R - Int(input[1])!
        let c = Int(input[0])! - 1
        robots.append((r: r, c: c, dir: dir[input[2]]!))
        arr[r][c] = i
    }

    for _ in 0..<M {
        let input = readStr()
        order(robotIndex: Int(input[0])! - 1, order: input[1], count: Int(input[2])!)
    }
    print("OK")
}

