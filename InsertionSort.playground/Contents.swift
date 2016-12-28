// Implement Insertion Sort - in place

// a simple array of unsorted integers

let numberList: Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]


func insertionSort(_ array: [Int]) -> [Int] {

    var numbers = array

    for i in 1..<numbers.count {
        var j = i
        while j > 0 && numbers[j] < numbers[j - 1] {
            swap(&numbers[j - 1], &numbers[j])
            j -= 1
        }
    }

    return numbers
}


insertionSort(numberList)