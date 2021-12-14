//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    var answer = 0
    var visited = Array(repeating: false, count: 10)
    var innings = Array(repeating: [Int](), count: n)
    
    for i in 0..<n {
        innings[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    func score(_ hitter: [Int]) {
        var index = 0
        var score = 0
        for i in 0..<n {
            var out = 0
            var one = false, two = false, three = false
            while out < 3 {
                switch innings[i][hitter[index] - 1] {
                case 1:
                    if three {
                        score += 1
                        three = false
                    }
                    if two {
                        three = true
                        two = false
                    }
                    if one {
                        two = true
                        one = false
                    }
                    one = true
                case 2:
                    if three {
                        score += 1
                        three = false
                    }
                    if two {
                        score += 1
                        two = false
                    }
                    if one {
                        three = true
                        one = false
                    }
                    two = true
                case 3:
                    if three {
                        score += 1
                        three = false
                    }
                    if two {
                        score += 1
                        two = false
                    }
                    if one {
                        score += 1
                        one = false
                    }
                    three = true
                case 4:
                    if three { score += 1 }
                    if two { score += 1 }
                    if one { score += 1 }
                    score += 1
                    three = false
                    two = false
                    one = false
                case 0:
                    out += 1
                default:
                    break
                }
                index += 1
                if index > 8 { index = 0 }
            }
        }
        
        if answer < score {
            answer = score
        }
    }
    
    func dfs(_ hitter: [Int]) {
        if hitter.count == 9 {
            score(hitter)
            return
        }
 
        if hitter.count == 3 && !visited[1] {
            var tempHitter = hitter
            visited[1] = true
            tempHitter.append(1)
            dfs(tempHitter)
            visited[1] = false
            return
        }
        
        for i in 2...9 {
            if !visited[i] {
                var tempHitter = hitter
                tempHitter.append(i)
                visited[i] = true
                dfs(tempHitter)
                visited[i] = false
            }
        }
    }
    
    dfs([Int]())
    
    print(answer)
}

main()
