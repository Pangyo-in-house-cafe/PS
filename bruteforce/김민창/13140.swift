//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    var visited = Array(repeating: false, count: 10)
    
    let n = Int(readLine()!)!
    
    var answer = false
    
    func check(_ num: [Int]) {
        let hello = num[0] * 10000 + num[1] * 1000 + num[2] * 100 + num[2] * 10 + num[3]
        let world = num[4] * 10000 + num[3] * 1000 + num[5] * 100 + num[2] * 10 + num[6]
        
        if hello + world == n {
            print(String(format: "%7d", hello))
            print(String(format: "+%6d", world))
            print("-------")
            print(String(format: "%7d", n))
            answer = true
        }
    }
    
    func dfs(_ num: [Int]) {
        if answer { return }
        if num.count == 7 {
            if num[0] == 0 || num[4] == 0 {
                return
            }
            check(num)
            return
        }
 
        for i in 0..<10 {
            if visited[i] { continue }
            visited[i] = true
            var temp = num
            temp.append(i)
            dfs(temp)
            visited[i] = false
        }
    }
    
    dfs([Int]())
    
    if !answer {
        print("No Answer")
    }
}

main()

