//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    var ip = readLine()!.components(separatedBy: ":")
    var answer = ""
    var isUse = false
    
    for (i, v) in ip.enumerated() {
        if isUse && v.isEmpty { ip.remove(at: i) }
        
        if !isUse && v.isEmpty { isUse = true }
    }
    
    isUse = false
    
    for i in 0..<ip.count {
        if !ip[i].isEmpty {
            var temp = ip[i]
            while temp.count < 4 {
                temp.insert("0", at: temp.startIndex)
            }
            temp.append(":")
            answer.append(contentsOf: temp)
        } else {
            if isUse { continue }
            let max = 9 - ip.count
            var temp = ""
            for _ in 0..<max {
                temp.append(contentsOf: "0000:")
            }
            answer.append(contentsOf: temp)
            isUse = true
        }
    }
    
    answer.removeLast()
    print(answer)
}

main()
