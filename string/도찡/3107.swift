//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

/*[😈][🔮][🦔]*/

func solve() {
    var input = readStr()[0]
    input = input.replacingOccurrences(of: "::", with: ":-1:")
    let address = input.split(separator: ":")
    var ans = ""

    for str in address {
        if str == "-1" {
            for _ in 0...8-address.count { ans += "0000:" }
            continue
        }
        for _ in 0..<4-str.count { ans += "0" }
        ans += str + ":"
    }

    ans.removeLast()
    print(ans)
}
