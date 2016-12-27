func addTwoDigits(n: Int) -> Int {
    var sum = 0
    var num = n
    while num > 0 {
        sum = sum + num % 10
        num /= 10
    }

    return sum
}


