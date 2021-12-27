//  template.swift
//  Copyright © 2021 도찡. All rights reserved.

import Foundation

func readStr() -> [String] {readLine()!.split(separator: " ").map{String($0)}}

/*[😈][🔮][🦔]*/

var str1 = [Character]()
var str2 = [Character]()
var str3 = [Character]()
var cache = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 102), count: 102), count: 102)

func dp(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a < 0 || b < 0 || c < 0 { return 0 }
    if cache[a][b][c] != -1 { return cache[a][b][c] }

    var ans = 0
    if str1[a] == str2[b] && str2[b] == str3[c] { ans = dp(a-1, b-1, c-1) + 1 }
    else if str1[a] == str2[b] { ans = max(dp(a-1, b-1, c), dp(a, b, c-1)) }
    else if str2[b] == str3[c] { ans = max(dp(a, b-1, c-1), dp(a-1, b, c)) }
    else if str1[a] == str3[c] { ans = max(dp(a-1, b, c-1), dp(a, b-1, c)) }
    else { ans = max(max(dp(a-1, b-1, c), dp(a-1, b, c-1)), dp(a, b-1, c-1)) }
    cache[a][b][c] = ans
    return ans
}

func solve() {
    str1 = Array(readStr()[0])
    str2 = Array(readStr()[0])
    str3 = Array(readStr()[0])
    print(dp(str1.count-1, str2.count-1, str3.count-1))
}
