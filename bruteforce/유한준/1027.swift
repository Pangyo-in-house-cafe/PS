import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    let buildings = readLine()!.split(separator: " ").map{ Double($0)! }
    
    func isVisible(first: Int, second: Int ) -> Bool {
        let gradient: Double = (buildings[second] - buildings[first]) / Double((second - first)) // 기울기
        
        let y = buildings[first] - gradient * Double(first) // y절편
        
        for i in first + 1..<second {
            if gradient * Double(i) + y <= buildings[i] {
                return false
            }
        }
        return true
    }
    
    var result = 0
    
    for i in 0..<n {
        var front = 0
        for j in 0..<i {
            if isVisible(first: j, second: i) {
                front += 1
            }
        }
        var back = 0
        for k in i + 1..<n {
            if isVisible(first: i, second: k) {
                back += 1
            }
        }
        result = max(result, front + back)
    }
    
    print(result)
}
