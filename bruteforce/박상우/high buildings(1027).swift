import Foundation

let N = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

func slope(a: (Int, Int), b: (Int, Int)) -> Float {
    return Float(b.1 - a.1) / Float(b.0 - a.0)
}

for (idx, height) in buildings.enumerated() {
    var currentRightSlope: Float = 0
    var rightCount = 0
    // 오른쪽
    for i in (idx+1..<N) {
        let rightSlope = slope(a: (idx, height), b: (i, buildings[i]))
        if i == idx + 1 || currentRightSlope < rightSlope {
            currentRightSlope = rightSlope
            rightCount += 1
        }
    }

    var currentLeftSlope: Float = 0
    var leftCount = 0
    // 왼쪽
    for i in stride(from: idx - 1, through: 0, by: -1) {
        let leftSlope = slope(a: (idx, height), b: (i, buildings[i]))
        if i == idx - 1 || currentLeftSlope > leftSlope {
            currentLeftSlope = leftSlope
            leftCount += 1
        }
    }
    
    result = max(result, leftCount + rightCount)
}

print(result)

