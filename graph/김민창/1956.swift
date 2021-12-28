//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

func main() {
    let inf = 987654321
    let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
    var graph = Array(repeating: Array(repeating: inf, count: ve[0] + 1), count: ve[0] + 1)
    
    for _ in 0..<ve[1] {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[line[0]][line[1]] = line[2]
    }
    
    for i in 1...ve[0] {
        for j in 1...ve[0] {
            for k in 1...ve[0] {
                graph[j][k] = min(graph[j][k], graph[j][i] + graph[i][k])
            }
        }
    }
    var answer = inf
    for i in 1...ve[0] {
        answer = min(graph[i][i], answer)
    }
    
    if answer == inf {
        print(-1)
        return
    }
    print(answer)
}

main()
