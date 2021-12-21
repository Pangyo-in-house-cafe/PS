import Foundation

solve()

func solve() {
    let aAndB = readLine()!.split(separator: " ").map{ Int($0)! }
    var a = aAndB[0]
    let b = aAndB[1]
    
    var isFind = false
    
    func dfs(index: Int) {
        if a == b {
            print(index)
            isFind = true
            return
        }
        if a > b || isFind {
            return
        }
        a *= 2
        dfs(index: index + 1)
        a /= 2
        a = a * 10 + 1
        dfs(index: index + 1)
        a = (a - 1) / 10
    }
    
    dfs(index: 1)
    
    if !isFind {
        print(-1)
    }
}
