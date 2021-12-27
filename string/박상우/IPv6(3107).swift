import Foundation

let input = readLine()!
let arr = input.components(separatedBy: ":")
var result = Array(repeating: "", count: 8)
var index = 0
var flag = true

for value in arr {
    if value.count == 4 {
        result[index] = value
        index += 1
    } else if value.count > 0 {
        result[index] = Array(repeating: "0", count: 4 - value.count).joined() + value
        index += 1
    } else {
        if flag {
            for _ in (0..<8-arr.count+1) {
                result[index] = "0000"
                index += 1
            }
            flag.toggle()
        } else {
            result[index] = "0000"
            index += 1
        }
    }
}

print(result.joined(separator: ":"))

