import Foundation

solve()

func solve() {
    let widthAndHeight = readLine()!.split(separator: " ").map{ Int($0)! }
    let height = widthAndHeight[0]
    let width = widthAndHeight[1]
    
    var maps = [[String]]()
    
    let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    for _ in 0..<height {
        let row = Array(readLine()!).map{ String($0) }
        maps.append(row)
    }
    
    func bfs(_ x: Int, _ y: Int) -> Int {
        var distance = [[Int]](repeating: [Int](repeating: -1, count: width), count: height)
        distance[y][x] = 0
        var index = 0
        var count = 0
        
        var queue = [(Int, Int)]()
        queue.append((x, y))
        
        while index < queue.count {
            let now = queue[index]
            index += 1
            
            for dir in dirs {
                let newX = now.0 + dir.0
                let newY = now.1 + dir.1
                
                if 0..<width ~= newX, 0..<height ~= newY, distance[newY][newX] == -1, maps[newY][newX] == "L" {
                    queue.append((newX, newY))
                    distance[newY][newX] = distance[now.1][now.0] + 1
                    count = max(count, distance[newY][newX])
                }
                
            }
        }
        return count
    }
    
    var result = 0
    
    for i in 0..<height {
        for j in 0..<width {
            if maps[i][j] == "L" {
                let count = bfs(j, i)
                result = max(result, count)
            }
        }
    }
    
    print(result)
}

