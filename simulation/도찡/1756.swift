//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.components(separatedBy: " ").map{Int(String($0))!}}
func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

typealias pii = (Int, Int)
let INF = INT32_MAX
let MOD = 1e9 + 7

/*[😈][🔮][🦔]*/

var D = 0
var N = 0
var oven = [Int]()
var pizza = [Int]()

func solve() {
    let input = readInt()
    D = input[0]
    N = input[1]
    oven = readInt()
    pizza = readInt()

    var minOven = oven[0]
    for i in 0..<oven.count {
        oven[i] = min(minOven, oven[i])
        minOven = oven[i]
    }
    oven = oven.reversed()

    var ovenIndex = 0
    var pizzaIndex = 0
    while ovenIndex < oven.count && pizzaIndex < pizza.count {
        if oven[ovenIndex] >= pizza[pizzaIndex] { pizzaIndex += 1 }
        ovenIndex += 1
    }

    if pizzaIndex == pizza.count { print(D - ovenIndex + 1) }
    else { print(0) }
}

