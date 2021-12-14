import Foundation

let N = Int(readLine()!)!
var combiArr: [Int] = []
let numberArray = "0123456789".map { String($0) }

func combination(_ target:[String], _ target_num: Int, _ index: Int,_ tmp:[String]){
    if tmp.count == target_num{
        let num = Int(tmp.sorted(by: >).joined())!
        combiArr.append(num)
        return
    }
    
    for i in index ..< target.count{
        combination(target, target_num, i+1, tmp + [target[i]])
    }
}

for i in (1..<11) {
    combination(numberArray, i, 0, [])
}

if combiArr.count <= N {
    print(-1)
} else {
    print(combiArr.sorted()[N])
}

