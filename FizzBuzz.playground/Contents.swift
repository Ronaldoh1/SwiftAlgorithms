//: Playground - noun: a place where people can play

import UIKit

func fizzBuzz(for numberOfTurns: Int) {

    for i in 1...numberOfTurns {
        // if number is divisible by 3 
        var result = ""

        if i % 3 == 0 {
            result += "Fizz"
        }

        if i % 5 == 0 {
            result += "Buzz"
        }

        if i % 3 == 0 && i % 5 == 0 {
            result += "FizzBuzz"
        }

        if result.isEmpty {
            result += "\(i)"
        }

        print(result)

    }

}

fizzBuzz(for: 15)