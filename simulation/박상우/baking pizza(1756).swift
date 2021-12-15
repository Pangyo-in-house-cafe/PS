let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let D = inputs[0]
let N = inputs[1]
var oven = Array(repeating: 0, count: D)
var dough = Array(repeating: 0, count: N)
var i = D-1

oven = readLine()!.split(separator: " ").map { Int($0)! }
dough = readLine()!.split(separator: " ").map { Int($0)! }.reversed()

for i in (0..<D-1) {
    if oven[i] < oven[i+1] {
        oven[i+1] = oven[i]
    }
}

while i > 0 {
    if oven[i] >= dough.last! {
        dough.popLast()
    }
    
    if dough.count == 0 {
        break
    }
    
    i -= 1
}

if dough.count > 0 {
    print(0)
} else {
    print(i + 1)
}

