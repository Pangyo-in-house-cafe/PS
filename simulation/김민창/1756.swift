//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let dn = readLine()!.split(separator: " ").map { Int($0)! }
    var diameter = readLine()!.split(separator: " ").map { Int($0)! }
    let pizza = readLine()!.split(separator: " ").map { Int($0)! }
    var stack = [Int]()
    var before = -1
    var depth = dn[0]
    
    stack.append(diameter.removeFirst())
    
    for d in diameter {
        if stack.last! > d {stack.append(d) }
        else { stack.append(stack.last!) }
    }
    
    for p in pizza {
        if before > 0 && before >= p {
            depth -= 1
            if depth < 0 { break }
            continue
        }
        var left = 0
        while left < depth {
            let mid = (left + depth) / 2
            if stack[mid] < p { depth = mid }
            else { left = mid + 1 }
        }
        before = p
        depth -= 1
        if depth < 0 { break }
    }
    print(depth + 1)
}

main()

