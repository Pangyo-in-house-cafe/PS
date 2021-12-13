import Foundation

solve()

func solve() {
    let aAndB = readLine()!.split(separator: " ").map{ Int($0)! }
    let nAndM = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let a = aAndB[0]
    let b = aAndB[1]
    let n = nAndM[0]
    let m = nAndM[1]
    
    var land = [[(Bool, Int, Int)]](repeating: [(Bool, Int, Int)](repeating: (false, -1, -1), count: a), count: b)
    var robots = [(Int, Int, Int)]()
    var commands = [(Int, Int, Int)]()
    
    let dirs = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    func reverse(_ row: Int) -> Int {
        return b - row - 1
    }
    
    for i in 0..<n {
        let robotInfo = readLine()!.split(separator: " ")
        let x = Int(robotInfo[0])! - 1
        let y = Int(robotInfo[1])! - 1

        var dir: Int {
            switch String(robotInfo[2]) {
            case "N":
                return 3
            case "E":
                return 0
            case "S":
                return 1
            case "W":
                return 2
            default:
                return -1
            }
        }
        robots.append((x, reverse(y), dir))
        land[reverse(y)][x] = (true, i, dir)
    }
    
    for _ in 0..<m {
        let commandInfo = readLine()!.split(separator: " ")
        var dir: Int {
            switch String(commandInfo[1]) {
            case "L":
                return -1
            case "R":
                return 1
            case "F":
                return 0
            default: return 0
            }
        }
        commands.append((Int(commandInfo[0])!, dir, Int(commandInfo[2])!))
    }
    
    commands.reverse()
    
    while !commands.isEmpty {
        let command = commands.popLast()!
        for _ in 0..<command.2 {
            let robot = robots[command.0 - 1]
            let x = robot.0
            let y = robot.1
            let dir = robot.2
            let newDir = (dir + command.1 + 4) % 4

            let newX = x + dirs[newDir].1
            let newY = y + dirs[newDir].0
            
            if dir == newDir {
                if !((0..<a) ~= newX) || !((0..<b) ~= newY) {
                    print("Robot \(command.0) crashes into the wall")
                    return
                }
                
                if land[newY][newX].0 == true {
                    print("Robot \(command.0) crashes into robot \(land[newY][newX].1 + 1)")
                    return
                }
                
                robots[command.0 - 1] = (newX, newY, newDir)
                land[y][x] = (false, -1, -1)
                land[newY][newX] = (true, command.0 - 1, newDir)
            }
            else {
                robots[command.0 - 1] = (x, y, newDir)
                land[y][x] = (true, command.0 - 1, newDir)
            }
        }
    }
    print("OK")
}
