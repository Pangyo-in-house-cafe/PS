import Foundation

solve()

func solve() {
    let formula = readLine()!
    
    var prev = ""
    
    var result = [String]()
    
    for char in formula {
        if char == ":" {
            if prev.isEmpty {
                result.append("0000")
            }
            else {
                while prev.count != 4 {
                    prev = "0" + prev
                }
                result.append(prev)
                prev = ""
            }
        }
        else {
            prev = prev + String(char)
        }
    }
    
    if !prev.isEmpty {
        while prev.count != 4 {
            prev = "0" + prev
        }
        result.append(prev)
    }
    
    if result.count != 8 {
        var index = result.firstIndex(of: "0000")!
        result.remove(at: index)
        while result.count < 8 {
            result.insert("0000", at: index)
            index += 1
        }
    }
    
    print(result.joined(separator: ":"))
}

