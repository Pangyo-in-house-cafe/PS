import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    var house = [[Int]]()
    
    for _ in 0..<n {
        house.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    house[0][0] = -1
    house[0][1] = -1
    
    var result = 0
    
    func dfs(first: (Int, Int), second: (Int, Int), dir: Int) {
        if house[n - 1][n - 1] == -1 {
            result += 1
            return
        }
        switch dir {
        case 0:
            if second.1 + 1 < n, house[second.0][second.1 + 1] != 1 {
                house[first.0][first.1] = 0
                house[second.0][second.1 + 1] = -1
                dfs(first: second, second: (second.0, second.1 + 1), dir: 0)
                house[first.0][first.1] = 1
                house[second.0][second.1 + 1] = 0
            }
            if second.0 + 1 < n, second.1 + 1 < n, house[second.0 + 1][second.1 + 1] != 1, house[second.0][second.1 + 1] != 1, house[second.0 + 1][second.1] != 1 {
                house[first.0][first.1] = 0
                house[second.0 + 1][second.1 + 1] = -1
                dfs(first: second, second: (second.0 + 1, second.1 + 1), dir: 1)
                house[first.0][first.1] = 1
                house[second.0 + 1][second.1 + 1] = 0
            }
        case 1:
            if second.1 + 1 < n, house[second.0][second.1 + 1] != 1 {
                house[first.0][first.1] = 0
                house[second.0][second.1 + 1] = -1
                dfs(first: second, second: (second.0, second.1 + 1), dir: 0)
                house[first.0][first.1] = 1
                house[second.0][second.1 + 1] = 0
            }
            if second.0 + 1 < n, house[second.0 + 1][second.1] != 1 {
                house[first.0][first.1] = 0
                house[second.0 + 1][second.1] = -1
                dfs(first: second, second: (second.0 + 1, second.1), dir: 2)
                house[first.0][first.1] = 1
                house[second.0 + 1][second.1] = 0
                
            }
            if second.0 + 1 < n, second.1 + 1 < n, house[second.0 + 1][second.1 + 1] != 1, house[second.0][second.1 + 1] != 1, house[second.0 + 1][second.1] != 1 {
                house[first.0][first.1] = 0
                house[second.0 + 1][second.1 + 1] = -1
                dfs(first: second, second: (second.0 + 1, second.1 + 1), dir: 1)
                house[first.0][first.1] = 1
                house[second.0 + 1][second.1 + 1] = 0
            }
        case 2:
            if second.0 + 1 < n, house[second.0 + 1][second.1] != 1 {
                house[first.0][first.1] = 0
                house[second.0 + 1][second.1] = -1
                dfs(first: second, second: (second.0 + 1, second.1), dir: 2)
                house[first.0][first.1] = 1
                house[second.0 + 1][second.1] = 0
            }
            if second.0 + 1 < n, second.1 + 1 < n, house[second.0 + 1][second.1 + 1] != 1, house[second.0][second.1 + 1] != 1, house[second.0 + 1][second.1] != 1 {
                house[first.0][first.1] = 0
                house[second.0 + 1][second.1 + 1] = -1
                dfs(first: second, second: (second.0 + 1, second.1 + 1), dir: 1)
                house[first.0][first.1] = 1
                house[second.0 + 1][second.1 + 1] = 0
            }
        default: break
        }
    }
    
    dfs(first: (0,0), second: (0,1), dir: 0)
    
    print(result)
}

