//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    var dices = Array(repeating: [Int](), count: n)
    
    for i in 0..<n {
        let dice = readLine()!.split(separator: " ").map { Int($0)! }
        dices[i] = dice
    }
    
    let map = [0: 5, 5: 0, 1: 3, 3: 1, 2: 4, 4: 2]
    
    var answer = 0
    for i in 0..<6 {
        var bottom = dices[0][i], top = dices[0][map[i]!]
        var sum = 0
        if (bottom + top) != 11 {
            if bottom == 6 || top == 6 { sum = 5 }
            else { sum = 6 }
        } else { sum = 4 }
        for j in 1..<n {
            for k in 0..<6 {
                if dices[j][k] == top {
                    bottom = dices[j][k]
                    top = dices[j][map[k]!]
                    if (bottom + top) != 11 {
                        if bottom == 6 || top == 6 { sum += 5 }
                        else { sum += 6 }
                    } else { sum += 4 }
                    break
                }
            }
        }
        answer = max(answer, sum)
    }
    
    print(answer)
}

main()

