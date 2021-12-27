//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    var queue = [(ab[0], 1)]
    
    while !queue.isEmpty {
        let q = queue.removeFirst()
        if q.0 > ab[1] { continue }
        var str = String(q.0)
        let multi = q.0 * 2
        let count = q.1 + 1
        str.append("1")
        
        let strNum = Int(str)!
        
        if strNum == ab[1] || multi == ab[1] {
            print(count)
            return
        }
        
        queue.append((strNum, count))
        queue.append((multi, count))
    }
    
    print("-1")
}

main()
