//: Implementation for Selection Sort

func selectionSort(_ array: [Int]) -> [Int] {
//1. if the array is empty or contains only one element, then there no point in sorting it. so we use that as our initial condition.
    guard array.count > 1 else {
        return array
    }
//2. create a copy of the array.
    var a = array

//3. The initial outer loop looks at each element in the array in turns. This moves the bar forward.
    for x in 0..<a.count - 1 {

        var lowest = x
//4. the inner loop finds the lowest number in the rest of the arary.
        for y in x + 1..<a.count {
            if a[y] < a[lowest] {
                lowest = y
            }
        }
//5. Swap the lowest number with the current index, if check is necessary because you can't swap() an element with itself in swift.
        if x != lowest {
            swap(&a[x], &a[lowest])
        }
    }
    return a
}