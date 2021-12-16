import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    var board = [[String]]()
    
    var teachers = [(Int, Int)]()
    
    var empty = [(Int, Int)]()
    
    var result: String = "NO"
    
    for i in 0..<n {
        var line = [String]()
        for (index, value) in readLine()!.split(separator: " ").enumerated() {
            line.append(String(value))
            if value == "T" {
                teachers.append((i, index))
            } else if value == "X" {
                empty.append((i, index))
            }
        }
        board.append(line)
    }

    func isFind() -> Bool {
        for teacher in teachers {
            for r in stride(from: teacher.0 - 1, through: 0, by: -1) { //좌표
                if board[r][teacher.1] == "O" {
                    break
                }
                if board[r][teacher.1] == "S" {
                   return true
                }
            }
            for r in teacher.0 + 1..<n {
                if board[r][teacher.1] == "O" {
                    break
                }
                if board[r][teacher.1] == "S" {
                    return true
                }
            }
            for c in stride(from: teacher.1 - 1, through: 0, by: -1) {
                if board[teacher.0][c] == "O" {
                    break
                }
                if board[teacher.0][c] == "S" {
                    return true
                }
            }
            for c in teacher.1 + 1..<n {
                if board[teacher.0][c] == "O" {
                    break
                }
                if board[teacher.0][c] == "S" {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(index: Int, count: Int) {
        if count == 3 {
            if !isFind() {
                result = "YES"
            }
            return
        }
        
        for i in index..<empty.count {
            board[empty[i].0][empty[i].1] = "O"
            dfs(index: i + 1, count: count + 1)
            board[empty[i].0][empty[i].1] = "X"
        }
    }
    
    dfs(index: 0, count: 0)
    
    print(result)
}

