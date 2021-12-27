import Foundation

solve()

func solve() {
    let formula = Array(readLine()!)
    var open = [Int]()
    var close = [Int]()
    var stack = [Int]()
    for i in 0..<formula.count {
        if formula[i] == "(" {
            stack.append(i)
            // open.append(i)
        } else if formula[i] == ")" {
            open.append(stack.popLast()!)
            close.append(i)
        }
    }

    var result = [String]()
    
    for i in 1...open.count {
        dfs(formula: formula, index: 0, now: 0, goal: i)
    }

    func dfs(formula: [Character], index: Int, now: Int, goal: Int) {
        if now == goal {
            result.append(formula.map{ String($0) }.filter({ $0 != " "}).joined(separator: ""))
            return
        }
        for i in index..<open.count {
            var temp = formula
            temp[open[i]] = " "
            temp[close[i]] = " "
            dfs(formula: temp, index: i + 1, now: now + 1, goal: goal)
        }
    }

    print(Array(Set(result)).sorted().joined(separator: "\n"))
}

