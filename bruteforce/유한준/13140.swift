import Foundation

solve()

func solve() {
    let n = Int(readLine()!)!
    
    if n > 184005 {
        print("No Answer")
        return
    }
    // d = 0, e = 1, h = 2, l = 3, o = 4, r = 5, w = 6
    func isPossible(numbers: [Int]) -> Bool {
        if numbers[2] == 0 || numbers[6] == 0 {
            return false
        }
        let hello = numbers[2] * 10000 + numbers[1] * 1000 + numbers[3] * 100 + numbers[3] * 10 + numbers[4]
        let world = numbers[6] * 10000 + numbers[4] * 1000 + numbers[5] * 100 + numbers[3] * 10 + numbers[0]
        
        if hello + world == n {
            print("  \(hello)")
            print("+ \(world)")
            print("-------")
            var result = String(n)
            while result.count != 7 {
                result = " " + result
            }
            print(result)
            return true
        }
        return false
    }
    
    var permutations = [[Int]]()
    
    
    let visited : [Bool] = Array(repeating: false, count: 10)
    
    func permutation(_ arr : [Int],_ output : [Int],_ visited : [Bool],_ depth : Int,_ n : Int,_ r : Int){
        let arr = arr
        var output = output
        var visited = visited

        if depth == r {
            permutations.append(output)
            return
        }
        for i in 0..<n {
            if visited[i] != true {
                visited[i] = true
                output[depth] = arr[i]
                permutation(arr,output,visited,depth + 1,n,r)
                output[depth] = 0
                visited[i] = false
            }
        }
    }
    
    permutation(Array(0...9), [Int](repeating: 0, count: 7), visited, 0, 10, 7)
    
    for permutation in permutations {
        if isPossible(numbers: permutation) {
            exit(0)
        }
    }
    
    print("No Answer")
}

