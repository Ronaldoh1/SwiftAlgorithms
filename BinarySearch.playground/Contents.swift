

func binarySearch(_ array: Array<Int>, key: Int) {

    let min = array.startIndex
    let max = array.endIndex
    let mid = (max - min) / 2



    // check the bound - if we don't find then then we simply return nil. No no element was found.

    if key > array[max] || key < array[min] {
        print("Search value was not found")
        return
    }

    // evaluate chosen number

    let n = array[mid]

    if n > key {
        let slice: Array<Int> = Array(array[min...mid - 1 ])
        binarySearch(slice, key: key)
    } else if n < key {
        let slice: Array<Int> = Array(array[mid + 1...max])
        binarySearch(slice, key: key)
    } else {
        print("item found")
        return
    }

}

binarySearch([1,2,3,10], key: 10)