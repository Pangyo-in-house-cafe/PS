import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let K = input[1]

var belt = readLine()!.split(separator: " ").map { Int($0)! }
var isRobots = Array(repeating: false, count: N * 2)
var count = 0
var i = 0

func moveIndex(N: Int, i: Int, value: Int) -> Int {
    return i + value < 0 ? (2 * N) + value : (i + value) % (N * 2)
}

while true {
    // 한칸 회전
    i = moveIndex(N: N, i: i, value: -1)
    
    // N번째 로봇 내리는 위치 확인
    let offIndex = moveIndex(N: N, i: i, value: N-1)
    isRobots[offIndex] = false
    
    // 다음 컨테이너 이동가능 확인
    for j in stride(from: N-2, through: -1, by: -1) {
        let idx = moveIndex(N: N, i: i, value: j)
        let nextIndex = moveIndex(N: N, i: idx, value: 1)
        if belt[nextIndex] > 0 && isRobots[idx] && !isRobots[nextIndex] {
            belt[nextIndex] -= 1
            isRobots[idx] = false
            isRobots[nextIndex] = true
            isRobots[offIndex] = false
        }
    }
    
    // 올리는 위치 확인
    if belt[i] > 0 {
        belt[i] -= 1
        isRobots[i] = true
    }
    
    count += 1
    
    // 내구도 K이상 확인
    if belt.filter({ $0 == 0 }).count >= K {
        break
    }
}

print(count)

