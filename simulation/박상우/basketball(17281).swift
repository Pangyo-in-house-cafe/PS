import Foundation

let N = Int(readLine()!)!
var ininings: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: N)
var maxScore = 0
let players = [1, 2, 3, 4, 5, 6, 7, 8]
var permutations: [[Int]] = []

for i in (0..<N) {
    ininings[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func permutation<T>(_ target: [T], _ targetNumber: Int, _ idx: Int) {
    if idx == targetNumber {
        var list = Array(target[0..<idx]) as! [Int]
        list.insert(0, at: 3)
        permutations.append(list)
        return
    }
    
    var target = target
    
    for i in idx..<target.count {
        target.swapAt(i, idx)
        permutation(target, targetNumber, idx+1)
        target.swapAt(i, idx)
    }
}

func playBasketBall(order: [Int]) {
    var score = 0
    var idx = 0
    for inining in ininings {
        var outCount = 0
        var a1 = 0
        var a2 = 0
        var a3 = 0
        while outCount < 3 {
            switch inining[order[idx]] {
            case 0:
                outCount += 1
            case 1:
                score += a3
                a3 = a2
                a2 = a1
                a1 = 1
            case 2:
                score += (a2 + a3)
                a3 = a1
                a2 = 1
                a1 = 0
            case 3:
                score += (a1 + a2 + a3)
                a3 = 1
                a2 = 0
                a1 = 0
            case 4:
                score += (1 + a1 + a2 + a3)
                a1 = 0
                a2 = 0
                a3 = 0
            default:
                break
            }
            
            idx = (idx + 1) % 9
        }
    }
    maxScore = max(maxScore, score)
}

permutation(players, 8, 0)
for order in permutations {
    playBasketBall(order: order)
}

print(maxScore)
