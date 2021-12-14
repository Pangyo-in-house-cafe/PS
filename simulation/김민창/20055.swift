//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func main() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    var durability = readLine()!.split(separator: " ").map { Int($0)! }
    var robots = Array(repeating: false, count: nk[0] * 2)
    var answer = 0
    func rotation() -> Bool {
        durability.insert(durability.removeLast(), at: 0)
        robots.insert(robots.removeLast(), at: 0)
        if robots[nk[0] - 1] {
            robots[nk[0] - 1] = false
        }
        
        var zero = 0
        for i in durability {
            if i == 0 { zero += 1 }
        }
        if zero >= nk[1] {
            return true
        }
        return false
    }
    
    func move() {
        var stack = [Int]()

        for i in 0..<(nk[0] - 1) {
            if robots[i] {
                stack.append(i)
                robots[i] = false
            }
        }
        
        if stack.isEmpty { return }
        
        for i in stack.reversed() {
            if durability[i + 1] > 0 && !robots[i + 1] {
                robots[i + 1] = true
                durability[i + 1] -= 1
                if (i + 1) == (nk[0] - 1) {
                    robots[i + 1] = false
                }
            } else {
                robots[i] = true
            }
        }
        stack.removeAll()
    }
    
    while true {
        if rotation() {
            print(answer)
            return
        }
        move()
        if durability[0] > 0 {
            durability[0] -= 1
            robots[0] = true
        }
        answer += 1
    }
}

main()
