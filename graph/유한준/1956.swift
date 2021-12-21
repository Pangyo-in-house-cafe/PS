import Foundation

solve()

func solve() {
    let vAndE = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let v = vAndE[0]
    let e = vAndE[1]
    
    var distances = [[Int]](repeating: [Int](repeating: Int.max, count: v), count: v)
    for i in 0..<v {
        distances[i][i] = 0
    }
    
    for _ in 0..<e {
        let aAndBAndC = readLine()!.split(separator: " ").map{ Int(String($0))! }
        
        let a = aAndBAndC[0] - 1
        let b = aAndBAndC[1] - 1
        let c = aAndBAndC[2]
        
        distances[a][b] = c
    }
    
    for k in 0..<v {
        for i in 0..<v {
            for j in 0..<v {
                if distances[i][k] != Int.max, distances[k][j] != Int.max {
                    if distances[i][k] + distances[k][j] < distances[i][j] {
                        distances[i][j] = distances[i][k] + distances[k][j]
                    }
                }
            }
        }
    }
    
    var result = Int.max
    
    for i in 0..<v {
        for j in 0..<v {
            if i != j, distances[i][j] != Int.max, distances[j][i] != Int.max {
                result = min(result, distances[i][j] + distances[j][i])
            }
        }
    }
    
    if result == Int.max {
        print(-1)
    } else {
        print(result)
    }
}

