import Foundation

let N = Int(readLine()!)!
var dices = Array(repeating: Array(repeating: 0, count: 6), count: N)
var result = 0

for i in (0..<N) {
    dices[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func otherSide(index: Int) -> Int {
    switch index {
    case 0: return 5
    case 1: return 3
    case 2: return 4
    case 3: return 1
    case 4: return 2
    case 5: return 0
    default: return -1
    }
}

func getMax(num: Int, bottomNum: Int) -> (Int, Int) {
    let myDice = dices[num]
    let idx = myDice.firstIndex(of: bottomNum)!
    let otherIdx = otherSide(index: idx)
    let topNum = myDice[otherIdx]
    
    let maxSide = myDice.enumerated()
                        .filter { $0.offset != idx && $0.offset != otherIdx }
                        .map { $0.element }
                        .max()!
    
    return (maxSide, topNum)
}

for i in (0..<6) {
    var maxValue = 0
    var maxSide = 0
    var bottomNum = dices[0][i]
    for j in (0..<N) {
        (maxSide, bottomNum) = getMax(num: j, bottomNum: bottomNum)
        maxValue += maxSide
    }
    
    result = max(maxValue, result)
}

print(result)

