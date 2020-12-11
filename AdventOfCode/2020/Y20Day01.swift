//
//  Year 2020
//  Day01.swift
//  AdventOfCode
//  Lighthouse16
//
//  Day 1: Report Repair
//  https://adventofcode.com/2020/day/1
//

import Foundation

class Year2020Day01 {

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d01")

        var numbers: [Int] = []

        for line in contentArray {
            if let number = Int(line) {
                numbers.append(number)
            }
        }

        // Part 1: find 2 numbers that sum up to 2020 and multiply those 2 numbers
        for number in numbers {
            let needed = 2020 - number
            if numbers.contains(needed) == true {
                let multiplierSum = number * needed
                print("Part1: \(multiplierSum)")
            }
        }

        // Part 2: find 3 numbers that sum up to 2020 and multiply those 3 numbers
        for number1 in numbers {
            for number2 in numbers {
                for number3 in numbers where number1 + number2 + number3 == 2020 {
                    let multiplierSum = number1 * number2 * number3
                    print("Part2: \(multiplierSum)")
                }
            }
        }
    }
}
