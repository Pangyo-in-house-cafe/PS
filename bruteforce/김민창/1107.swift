//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var breakdown = Array(repeating: false, count: 11)
    if m != 0 {
        let button = readLine()!.split(separator: " ").map { Int($0)! }
        for i in button { breakdown[i] = true }
    }
    
    var answer = abs(n - 100)
    
    for i in 0...999999 {
        let num = String(i).map { $0.wholeNumberValue! }
        let count = num.count
        var flag = false
        for j in 0..<count {
            if breakdown[num[j]] {
                flag = true
                break
            }
        }
        
        if !flag { answer = min(answer, abs(n - i) + count) }
    }
    print(answer)
}

main()

