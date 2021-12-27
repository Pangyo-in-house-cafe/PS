import Foundation

var formula = readLine()!.map { String($0) }
var tupple: [(Int, Int)] = []
var stack: [Int] = []
var combinations: [[(Int, Int)]] = []
var results: Set<String> = []

for (idx, s) in formula.enumerated() {
    if s == "(" {
        stack.append(idx)
    } else if s == ")" {
        let left = stack.popLast()!
        tupple.append((left, idx))
    }
}

func combination<T>(_ target:[T], _ num: Int, _ index: Int,_ tmp:[T]) {
    if tmp.count == num{
        combinations.append(tmp as! [(Int, Int)])
        return
    }
    
    for i in index ..< target.count{
        combination(target, num, i+1, tmp + [target[i]])
    }
}

for i in (1...tupple.count) {
    combination(tupple, i, 0, [])
}

for combination in combinations {
    var result = formula
    for tupple in combination {
        result[tupple.0] = ""
        result[tupple.1] = ""
    }
    results.insert(result.joined())
}

for result in results.sorted() {
    print(result)
}

