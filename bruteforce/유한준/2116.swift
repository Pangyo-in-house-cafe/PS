import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    var dices = [[Int]]()
    
    for _ in 0..<n {
        dices.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    let pair: [Int : Int] = [0: 5, 1: 3, 2: 4, 3: 1, 4: 2, 5: 0]
    
    var result = 0
    
    for i in 0..<6 {
        var score = 0
        var index = i
        var lastNumber = 0
        for (j, dice) in dices.enumerated() {
            if j != 0 {
                index = dice.firstIndex(of: lastNumber)!
            }
            if dice[index] != 6, dice[pair[index]!] != 6 {
                score += 6
            } else if dice[index] != 5, dice[pair[index]!] != 5 {
                score += 5
            } else {
                score += 4
            }
            lastNumber = dice[pair[index]!]
        }
        result = max(result, score)
    }
    
    print(result)
}
