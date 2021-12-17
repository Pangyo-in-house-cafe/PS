//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    let dx = [-1, 0, 1, 0], dy = [0, -1, 0, 1]
    var graph = Array(repeating: [Character](), count: n)
    var teacher = [(Int, Int)]()
    var answer = false
    var empty = [(Int, Int)]()
    for i in 0..<n {
        let line = Array(readLine()!.split(separator: " "))
        for (j, v) in line.enumerated() {
            graph[i].append(v.first!)
            if v.first! == "T" { teacher.append((i, j)) }
            if v.first! == "X" { empty.append((i, j)) }
        }
    }
    
    if teacher.isEmpty { answer = true }
    
    func check() -> Bool {
        for v in teacher {
            for i in 0..<4 {
                var x = v.0, y = v.1
                while true {
                    let xx = x + dx[i], yy = y + dy[i]
                    if xx < 0 || yy < 0 || xx >= n || yy >= n { break }
                    if graph[xx][yy] == "T" || graph[xx][yy] == "O" { break }
                    if graph[xx][yy] == "S" { return false }
                    x = xx
                    y = yy
                }
            }
        }
        return true
    }
    
    var lineVisited = Array(repeating: false, count: empty.count)
    let max = empty.count
    
    func dfs(_ index: Int, _ obstacle: [(Int, Int)]) {
        if obstacle.count == 3 {
            for o in obstacle { graph[o.0][o.1] = "O" }
            if check() { answer = true }
            for o in obstacle { graph[o.0][o.1] = "X" }
            return
        }
        
        if index >= max || answer { return }
        
        for i in index..<max {
            if lineVisited[i] { continue }
            lineVisited[i] = true
            var temp = obstacle
            temp.append(empty[i])
            dfs(i + 1, temp)
            lineVisited[i] = false
        }
    }
    
    dfs(0, [(Int, Int)]())
    if answer { print("YES") }
    else { print("NO") }
}

main()

