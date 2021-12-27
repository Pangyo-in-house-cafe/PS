//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let str = readLine()!.map { $0 }
    var answer = [String]()
    var parenthesis = [(Int, Int)]()
    var stack = [Int]()
    for (i, v) in str.enumerated() {
        if v == "(" { stack.append(i)
        } else if v == ")" { parenthesis.append((stack.removeLast(), i)) }
    }
    
    var removeParenthesis = [Int]()
    let max = parenthesis.count
    var visited = Array(repeating: false, count: max)
    
    func dfs(_ i: Int) {
        if !removeParenthesis.isEmpty {
            var tempStr = ""
            var check = Array(repeating: false, count: str.count)
            for i in removeParenthesis {
                check[parenthesis[i].0] = true
                check[parenthesis[i].1] = true
            }
            for i in 0..<str.count {
                if !check[i] {
                    tempStr.append(str[i])
                }
            }
            answer.append(tempStr)
        }
        
        for i in i..<max {
            if !visited[i] {
                visited[i] = true
                removeParenthesis.append(i)
                dfs(i)
                visited[i] = false
                removeParenthesis.removeLast()
            }
        }
    }
    
    dfs(0)
    
    answer.sort()
    var beforeStr = ""
    for s in answer {
        if s == beforeStr {
            continue
        }
        print(s)
        beforeStr = s
    }
}

main()
