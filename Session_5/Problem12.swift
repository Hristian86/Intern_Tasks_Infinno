func sort(_ arr:inout [Int]) {
    for i in 0..<arr.count {
        var curMin = min(arr,i)
        var temp = arr[i]
        arr[i]  =  arr[curMin]
        arr[curMin] = temp
    }
}

func min(_ arr: [Int], _ n: Int) -> Int {
    var min : Int = n
    for i in n+1 ..< arr.count {
        if arr[i] < arr[min] {
            min = i
        }
    }
    return min
}

var a = [2,3,5,3,7,9,5]
sort(&a) // & е pointer
print(a)