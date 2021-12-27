import Foundation

let inputs = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let A = inputs[0]
let B = inputs[1]
let operators: [Character] = ["*", "+"]
var queue: [(Int, Int)] = [(A, 0)]
var result = 0

func bfs() {
    while !queue.isEmpty {
        let value = queue.removeFirst()
        if value.0 == B {
            result = value.1
            return
        } else if value.0 < B {
            for oper in operators {
                switch oper {
                case "*":
                    queue.append((value.0 * 2 ,value.1 + 1))
                case "+":
                    queue.append((value.0 * 10 + 1, value.1 + 1))
                default:
                    return
                }
            }
        }
    }
}

bfs()
if result == 0 {
    print(-1)
} else {
    print(result + 1)
}
