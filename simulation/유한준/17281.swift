import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    var result = 0
    
    var inning = [[Int]]()
    var permutations = [[Int]]()
    
    func permutation(_ a: [Int], _ n: Int) {
        if n == 0 {
            permutations.append(a)
        } else {
            var a = a
            permutation(a, n - 1)
            for i in 0..<n {
                a.swapAt(i, n)
                permutation(a, n - 1)
                a.swapAt(i, n)
            }
        }
    }
    
    permutation(Array(1...8), 7)
    
    for _ in 0..<n {
        inning.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    for permutation in permutations {
        var score = 0
        let permutation = permutation[0...2] + [0] + permutation[3...7]
        var bases = [Bool](repeating: false, count: 3)
        var inningNumber = 0
        var order = 0
        outer : while inningNumber < n {
            let inning = inning[inningNumber]
            var outCount = 0
            while true {
                let hit = inning[permutation[order]]
                order = (order + 1) % 9
                switch hit {
                case 0:
                    outCount += 1
                    if outCount == 3 {
                        inningNumber += 1
                        bases = [Bool](repeating: false, count: 3)
                        continue outer
                    }
                case 1:
                    //bases = [true] + bases
                    if bases[2] {
                        bases[2] = false
                        score += 1
                    }
                    if bases[1] {
                        bases[1] = false
                        bases[2] = true
                    }
                    if bases[0] {
                        bases[0] = false
                        bases[1] = true
                    }
                    bases[0] = true
                case 2:
                    //bases = [false, true] + bases
                    if bases[2] {
                        bases[2] = false
                        score += 1
                    }
                    if bases[1] {
                        bases[1] = false
                        score += 1
                    }
                    if bases[0] {
                        bases[0] = false
                        bases[2] = true
                    }
                    bases[1] = true
                case 3:
                    //bases = [false, false, true] + bases
                    if bases[2] {
                        bases[2] = false
                        score += 1
                    }
                    if bases[1] {
                        bases[1] = false
                        score += 1
                    }
                    if bases[0] {
                        bases[0] = false
                        score += 1
                    }
                    bases[2] = true
                case 4:
                    //bases = [false, false, false] + bases
                    if bases[2] {
                        bases[2] = false
                        score += 1
                    }
                    if bases[1] {
                        bases[1] = false
                        score += 1
                    }
                    if bases[0] {
                        bases[0] = false
                        score += 1
                    }
                    score += 1
                default: break
                }
                //score += bases[3..<bases.count].filter{ $0 == true}.count
                //bases = Array(bases[0...2])
            }
        }
        result = max(result, score)
    }
    print(result)
}


