//: Playground - noun: a place where people can play

import UIKit


func linearSearch(_ value: Int, array: Array<Int>) -> Int? {
    let searchArray = array

    for number in searchArray {
        if number == value {
            return number
        }
    }
    return nil
}


linearSearch(2, array: [1, 2, 3, 4, 5])