//: Two Sum Problem. Given array a, find if a[i] + a[j] = k

import UIKit

func twoSum(_ numbers: [Int], target: Int) -> (Int, Int)? {
    var dictionary = Dictionary<Int, Any>()

    for i in numbers {
        let compliment = target - numbers[i]
        if (dictionary[compliment] != nil) {
            return (compliment, numbers[i])
        }
        dictionary[numbers[i]] = i
    }

    return nil // numbers were not found
}



twoSum([2, 2, 4, 5, 9, 10], target: 19)