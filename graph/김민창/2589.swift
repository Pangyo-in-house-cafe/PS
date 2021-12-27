//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    var graph = Array(repeating: [Character](), count: nm[0])
    for i in 0..<nm[0] {
        let x = readLine()!.map { $0 }
        graph[i] = x
    }
    
    var answer = 0
    
    let dx = [-1, 0, 1, 0], dy = [0, -1, 0, 1]
    
    for i in 0..<nm[0] {
        for j in 0..<nm[1] {
            var visited = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])
            if graph[i][j] == "L" {
                var queue = [(i, j, 0)]
                visited[i][j] = true
                while !queue.isEmpty {
                    let coordinate = queue.removeFirst()
                    
                    for k in 0..<4 {
                        let xx = coordinate.0 + dx[k], yy = coordinate.1 + dy[k]
                        let distance = coordinate.2 + 1
                        
                        if xx < 0 || yy < 0 || xx >= nm[0] || yy >= nm[1] { continue }
                        if visited[xx][yy] || graph[xx][yy] == "W" { continue }
                        answer = max(answer, distance)
                        
                        queue.append((xx, yy, distance))
                        visited[xx][yy] = true
                    }
                }
            }
        }
    }
    
    print(answer)
}

main()
