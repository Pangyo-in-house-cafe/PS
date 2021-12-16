import Foundation

let N = Int(readLine()!)!
var corridor: [[Character]] = []
let direction: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var points: [String] = []
var combinationPoints: [[String]] = []
var isEnd = false

for _ in (0..<N) {
    let row = readLine()!.components(separatedBy: " ").map { Character($0) }
    corridor.append(row)
}

func permutation<T>(_ target: [T], _ targetNumber: Int, _ idx: Int) {
    if idx == targetNumber {
        combinationPoints.append(Array(target[0..<idx]) as! [String])
        return
    }
    
    var target = target
    
    for i in idx..<target.count {
        target.swapAt(i, idx)
        permutation(target, targetNumber, idx+1)
        target.swapAt(i, idx)
    }
}

func check(maps: [[Character]]) -> Bool {
    for i in (0..<N) {
        for j in (0..<N) {
            if maps[i][j] == "S" {
                for direct in direction {
                    var dx = i
                    var dy = j
                    while true {
                        dx += direct.0
                        dy += direct.1
                        if (0..<N) ~= dx && (0..<N) ~= dy {
                            if maps[dx][dy] == "O" { break }
                            else if maps[dx][dy] == "T" {
                                return false
                            }
                        } else {
                            break
                        }
                    }
                }
            }
        }
    }
    
    return true
}

for i in (0..<N) {
    for j in (0..<N) {
        if corridor[i][j] == "X" {
            points.append("\(i)\(j)")
        }
    }
}

let combi = Array(Set(points))
permutation(combi, 3, 0)

for values in combinationPoints {
    var maps = corridor
    for value in values {
        let corridorPoint = value.map { Int(String($0))! }
        maps[corridorPoint[0]][corridorPoint[1]] = "O"
    }
    if check(maps: maps) {
        print("YES")
        exit(0)
    }
}

print("NO")

