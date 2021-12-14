import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    var numbers = Array(0...9)
    var count = 0
    
    if (0...9) ~= n {
        print(n)
        return
    }
    
    while count < 1023 {
        let front = numbers[count] % 10
        for i in 0..<front {
            numbers.append(numbers[count] * 10 + i)
            
            if  n == numbers.count - 1 {
                print(numbers[n])
                return
            }
        }
        count += 1
    }
    
    print(-1)
}

