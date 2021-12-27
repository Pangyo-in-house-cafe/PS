//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

/*[😈][🔮][🦔]*/

var input = [Character]()
var validate = [Bool]()
var brackets = [(left: Int, right: Int)]()
var ans = Set<String>()

func makeString() {
    var str = ""
    for i in 0..<input.count {
        if validate[i] { str.append(input[i]) }
    }
    ans.insert(str)
}

func dfs(_ index: Int) {
    if index == brackets.count {
        makeString()
        return
    }
    let bracket = brackets[index]
    validate[bracket.left] = false
    validate[bracket.right] = false
    dfs(index + 1)
    validate[bracket.left] = true
    validate[bracket.right] = true
    dfs(index + 1)
}

func solve() {
    input = Array(readStr()[0])
    validate = [Bool](repeating: true, count: input.count)

    var stack = [Int]()
    for i in 0..<input.count {
        if input[i] == "(" { stack.append(i) }
        else if input[i] == ")" {
            let left = stack.removeLast()
            brackets.append((left, i))
        }
    }

    dfs(0)
    var flag = true
    for str in ans.sorted() {
        if flag { flag = false }
        else { print(str) }
    }
}
