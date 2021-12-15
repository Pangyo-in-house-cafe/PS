//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    var visited = Array(repeating: false, count: dist.count)
    var answer = 10
    var weakWall = weak
    var resultPeople = [Int]()
    var tempDist = dist.sorted()
    tempDist.reverse()
    for wall in weak { weakWall.append(wall + n) }
    weakWall.removeLast()
    
    func check(_ people: [Int]) -> Bool {
        let len = weak.count
        
        for i in 0..<len {
            var idx = 0
            var startPoint = weakWall[i]
            var flag = true
            
            for j in i..<(i+len) {
                if weakWall[j] - startPoint > people[idx] {
                    startPoint = weakWall[j]
                    idx += 1
                    
                    if idx == people.count {
                        flag = false
                        break
                    }
                }
            }
            if flag { return true }
        }
        return false
    }
    
    func calculation(_ people: [Int]) {
        if people.count >= answer { return }
        resultPeople = [Int]()
        for i in people { resultPeople.append(tempDist[i]) }
        if check(resultPeople) {
            answer = people.count
        }
    }
    
    func dfs(_ people: [Int]) {
        if !people.isEmpty { calculation(people) }
        
        for i in 0..<dist.count {
            if !visited[i] {
                visited[i] = true
                var tempPeople = people
                tempPeople.append(i)
                dfs(tempPeople)
                visited[i] = false
            }
        }
    }
    
    dfs([Int]())
    
    if answer == 10 { return -1 }
    return answer
}

//print(solution(12, [1, 5, 6, 10], [1, 2, 3, 4]))
//print(solution(12, [1, 3, 4, 9, 10], [3, 5, 7]))
print(solution(200, [0, 10, 50, 90, 130, 160], [1, 10, 5, 40, 30]))

