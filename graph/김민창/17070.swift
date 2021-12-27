//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n + 1), count: n + 1)
    for i in 1...n {
        var line = readLine()!.split(separator: " ").map { Int($0)! }
        line.insert(0, at: 0)
        graph[i] = line
    }
    
    dp[1][2][0] = 1
    
    for i in 1...n {
        for j in 3...n {
            if graph[i][j] == 0 {
                dp[i][j][0] = dp[i][j - 1][0] + dp[i][j - 1][2]
                dp[i][j][1] = dp[i - 1][j][1] + dp[i - 1][j][2]
                
                if graph[i - 1][j] != 1 && graph[i][j - 1] != 1 {
                    dp[i][j][2] = dp[i - 1][j - 1][0] + dp[i - 1][j - 1][1] + dp[i - 1][j - 1][2]
                }
            }
        }
    }
    print(dp[n][n][0] + dp[n][n][1] + dp[n][n][2])
}

main()
