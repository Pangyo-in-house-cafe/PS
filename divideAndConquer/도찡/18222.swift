//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readInt() -> [Int] {readLine()!.split(separator: " ").map({Int(String($0))!})}

func divideAndConqure(_ n: Int) -> Int {
    if n == 0 { return 0 }
    let p = Int(log2(Double(n)))
    return (divideAndConqure(n - Int(pow(Double(2), Double(p)))) + 1) % 2
}

/*[😈][🔮][🦔]*/

func solve() {
    let k = readInt()[0]
    print(divideAndConqure(k-1))
}
