import Foundation

solve()

func solve() {
    let k = Int(readLine()!)! - 1
    
    func recursive(_ number: Int) -> Int{
        if number == 0 {
            return 0
        }
        if number == 1 {
            return 1
        }
        if number % 2 == 0 {
            return recursive(number / 2)
        }
        else {
            return 1 - recursive(Int(number / 2))
        }
    }
    
    print(recursive(k))
}

