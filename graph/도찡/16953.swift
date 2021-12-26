//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.split(separator: " ").map({Int(String($0))!})}

/*[😈][🔮][🦔]*/

func solve() {
    let input = readInt()
    let A = input[0]
    let B = input[1]

    var qu = [(num: Int, cost: Int)]()
    var front = 0
    qu.append((A, 0))

    while front < qu.count {
        let current = qu[front].num
        let cost = qu[front].cost
        front += 1

        if current == B { print(cost+1); exit(0) }
        if current * 2 <= B { qu.append((current * 2, cost + 1)) }
        if 10 * current + 1 <= B { qu.append((10 * current + 1, cost + 1)) }
    }

    print(-1)
}
