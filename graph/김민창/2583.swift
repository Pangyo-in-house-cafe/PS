//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    var graph = Array(repeating: Array(repeating: false, count: mnk[1]), count: mnk[0])
    for _ in 0..<mnk[2] {
        let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
        for i in min(coordinate[1], coordinate[3])..<max(coordinate[1], coordinate[3]) {
            for j in min(coordinate[0], coordinate[2])..<max(coordinate[0], coordinate[2]) {
                graph[i][j] = true
            }
        }
    }
    
    var answer = [Int]()
    
    let dx = [-1, 0, 1, 0], dy = [0, -1, 0, 1]
    
    for i in 0..<mnk[0] {
        for j in 0..<mnk[1] {
            if !graph[i][j] {
                var queue = [(i, j)]
                var result = 1
                graph[i][j] = true
                
                while !queue.isEmpty {
                    let coordinate = queue.removeFirst()
                    for i in 0..<4 {
                        let xx = coordinate.0 + dx[i], yy = coordinate.1 + dy[i]
                        if xx < 0 || yy < 0 || xx >= mnk[0] || yy >= mnk[1] { continue }
                        if graph[xx][yy] { continue }
                        
                        graph[xx][yy] = true
                        result += 1
                        queue.append((xx, yy))
                    }
                }
                
                answer.append(result)
            }
        }
    }
    
    answer.sort()
    
    print(answer.count)
    
    for i in answer {
        print(i, terminator: " ")
    }
}

main()
