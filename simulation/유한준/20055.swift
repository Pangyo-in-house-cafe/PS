import Foundation

solve()

func solve() {
    let nAndK = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = nAndK[0]
    let k = nAndK[1]
    
    let tempBelt = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var belt =  [[Int]]()
    belt.append(Array(tempBelt[0..<n])) // 벨트 위
    belt.append(Array(tempBelt[n..<2 * n].reversed())) // 벨트 아래
    
    var isRobot = [Bool](repeating: false, count: n)
    
    func rotate() {
        belt[0].insert(belt[1].removeFirst(), at: 0)
        belt[1].append(belt[0].removeLast())
        isRobot.removeLast()
        isRobot = [false] + isRobot
        isRobot[n - 1] = false
    }
    
    var count = 0
    
    while belt.flatMap({ $0 }).filter({ $0 == 0 }).count < k {
        count += 1
        
        // 1
        rotate()

        // 2
        for i in stride(from: n - 2, to: 0, by: -1) {
            if isRobot[i] == true, isRobot[i + 1] == false, belt[0][i + 1] > 0 {
                isRobot[i] = false
                isRobot[i + 1] = true
                if i + 1 == n - 1 {
                    isRobot[i + 1] = false
                }
                belt[0][i + 1] -= 1
            }
        }

        // 3
        if belt[0][0] > 0 {
            belt[0][0] -= 1
            isRobot[0] = true
        }

    }
    
    print(count)
}


