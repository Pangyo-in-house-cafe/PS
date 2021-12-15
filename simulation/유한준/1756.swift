import Foundation

solve()

func solve() {
    
    let dAndN = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let d = dAndN[0]
    let n = dAndN[1]
    
    var oven = readLine()!.split(separator: " ").map{ Int($0)! }
    let doughs = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for i in 1..<d {
        oven[i] = min(oven[i - 1], oven[i])
    }
    
    var lastPos = d - 1
    
    for (index,dough) in doughs.enumerated() {
        if lastPos < 0 {
            print(0)
            return
        }
        if index != 0, dough <= doughs[index - 1] {
            lastPos -= 1
        }
        else {
            for i in stride(from: lastPos, through: 0, by: -1) {
                if i == 0, dough > oven[i] {
                    print(0)
                    return
                }
                if dough <= oven[i] {
                    lastPos = i - 1
                    break
                }
            }

        }
    }
    
    print(lastPos + 2)
}

