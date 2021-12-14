//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let dy = [0, 1, 0, -1], dx = [-1, 0, 1, 0]
    let direction = ["W": 0, "N": 1, "E": 2, "S": 3]
     
    var robotsDirection = Array(repeating: 0, count: nm[0] + 1)
    var robotsPosition = Array(repeating: (0, 0), count: nm[0] + 1)
    
    var visited = Array(repeating: Array(repeating: -1, count: ab[0] + 1), count: ab[1] + 1)
    
    for i in 1...nm[0] {
        let robot = readLine()!.split(separator: " ")
        robotsPosition[i] = (Int(robot[0])!, Int(robot[1])!)
        robotsDirection[i] = direction[String(robot[2])]!
        visited[Int(robot[1])!][Int(robot[0])!] = i
    }
    
    for _ in 0..<nm[1] {
        let command = readLine()!.split(separator: " ")
        let robotNum = Int(command[0])!
        switch String(command[1]){
        case "L":
            for _ in 1...Int(command[2])! {
                var direction = robotsDirection[robotNum]
                direction -= 1
                if direction < 0 {
                    direction = 3
                }
                robotsDirection[robotNum] = direction
            }
        case "R":
            for _ in 1...Int(command[2])! {
                var direction = robotsDirection[robotNum]
                direction += 1
                if direction > 3 {
                    direction = 0
                }
                robotsDirection[robotNum] = direction
            }
        case "F":
            let direction = robotsDirection[robotNum]
            for _ in 0..<Int(command[2])! {
                let y = robotsPosition[robotNum].1 + dy[direction]
                let x = robotsPosition[robotNum].0 + dx[direction]
                if y < 1 || x < 1 || y > ab[1] || x > ab[0] {
                    print("Robot \(robotNum) crashes into the wall")
                    return
                }
                
                if visited[y][x] > 0 {
                    print("Robot \(robotNum) crashes into robot \(visited[y][x])")
                    return
                }
                
                visited[robotsPosition[robotNum].1][robotsPosition[robotNum].0] = -1
                visited[y][x] = robotNum
                robotsPosition[robotNum] = (x, y)
            }
        default:
            break
        }
    }
    
    print("OK")
}

main()
