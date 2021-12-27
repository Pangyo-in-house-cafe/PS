//
//  main.swift
//  Swift-PS
//
//  Created by 김민창 on 2021/07/24.
//

import Foundation

func t(_ n: Int64) -> Int {
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    
    if n % 2 == 1 { return 1 - t(n/2) }
    else { return t(n/2) }
}

func main() {
    let n = Int64(readLine()!)!
    print(t(n - 1))
}

main()
