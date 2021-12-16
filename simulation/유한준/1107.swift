import Foundation

let n = Int(readLine()!)!

let m = Int(readLine()!)!

var brokenButtons = [Character]()

if m != 0 {
    brokenButtons = readLine()!.split(separator: " ").map{ Character(String($0)) }
}

let aliveButton = Set(["0","1","2","3","4","5","6","7","8","9"]).subtracting(Set(brokenButtons)).map{ Character(String($0)) } // Set


var result = abs(n  - 100)

if result == 0 || aliveButton.count == 0 { } // 100번이거나 버튼 다 부숴졌을때(무조건 +, -)
else if Set(String(n)).subtracting(aliveButton).count == 0 { // 숫자로만 입력 가능 할 때
    result = min(result, String(n).count)
}
else {
    var index = 1
    while index <= 500000 {
        let up = n + index
        let down = n - index
        if Set(String(up)).subtracting(aliveButton).count == 0 {
            result = min(result, index + String(up).count)
        }
        if down >= 0, Set(String(down)).subtracting(aliveButton).count == 0{
            result = min(result, index + String(down).count)
        }
        if result != abs(n - 100) {
            break
        }
        index += 1
    }
}

print(result)


