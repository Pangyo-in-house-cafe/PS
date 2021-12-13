import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0]
let B = input[1]

let input2 = readLine()!.split(separator: " ").map { Int($0)! }
let N = input2[0]
let M = input2[1]
var points: [(Int, Int, Int)] = []
var dirction: [Int] = []
let direction = [(1, 0), (0, -1), (-1, 0), (0, 1)]
var isEnd = false

func convert(direction: String) -> Int {
    switch direction {
    case "E":
        return 0
    case "W":
        return 2
    case "S":
        return 1
    case "N":
        return 3
    default:
        return -1
    }
}

func move(num: Int, cmd: String, count: Int) {
    var curDirection = points[num-1].2
    var a = points[num-1].0
    var b = points[num-1].1
    switch cmd {
    case "L":
        curDirection = (curDirection - count) % 4 < 0 ? 4 + ((curDirection - count) % 4) : (curDirection - count) % 4
    case "R":
        curDirection = (curDirection + count) % 4
    case "F":
        for _ in (0..<count) {
            let da = a + direction[curDirection].0
            let db = b + direction[curDirection].1
            if (1...A) ~= da && (1...B) ~= db {
                for (idx, val) in points.enumerated() {
                    if idx != num-1 && val.0 == da && val.1 == db {
                        print("Robot \(num) crashes into robot \(idx + 1)")
                        isEnd = true
                        return
                    }
                }
                a = da
                b = db
            } else {
                print("Robot \(num) crashes into the wall")
                isEnd = true
                return
            }
        }
    default:
        return
    }
    
    points[num-1] = (a, b, curDirection)
}

for _ in (0..<N) {
    let input = readLine()!.split(separator: " ")
    points.append((Int(input[0])!, Int(input[1])!, convert(direction: String(input[2]))))
}

for _ in (0..<M) {
    if !isEnd {
        let input = readLine()!.split(separator: " ")
        move(num: Int(input[0])!, cmd: String(input[1]), count: Int(input[2])!)
    }
}

if !isEnd {
    print("OK")
}

