//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    var visited = Array(repeating: false, count: 10)
    var answer = [Int]()
    
    if n >= 1023 {
        print(-1)
        return
    }
    
    func dfs(_ index: Int, _ str: String) {
        if str.count > 10 { return }
        
        if !str.isEmpty {
            let number = Int(String(str.sorted().reversed()))!
            answer.append(number)
        }
    
        for i in index..<10 {
            if !visited[i] {
                visited[i] = true
                let appendStr = str + "\(i)"
                dfs(i + 1, appendStr)
                visited[i] = false
            }
        }
    }
    
    dfs(0, "")
    
    answer.sort()
    
    print(answer[n])
}

main()
