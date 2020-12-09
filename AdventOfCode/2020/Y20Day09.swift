//
//  Year 2020
//  Day09.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

class Year2020Day09 {

    func twoSum(nums: [Int], target: Int) -> (Int, Int)? {
        var dict = [Int: Int]()

        for (currentIndex, n) in nums.enumerated() {
            let complement = target - n

            if let complementIndex = dict[complement] {
                return (complementIndex, currentIndex)
            }

            dict[n] = currentIndex
        }

        return nil
    }

    func subArraySum(array: [Int], sum: Int) -> [Int] {
        for i in 0..<array.count {
            for x in i..<array.count {
                let valueRange = Array(array[i...x])
                let rangeSum = valueRange.reduce(0, +)

                if rangeSum == sum {
                    let smallestValue = valueRange.min() ?? 9999999999
                    let largestValue = valueRange.max() ?? 999999999
                    return [smallestValue, largestValue]
                }
            }
        }

        return [0]
    }

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d09")

        var lineCount = 0
        var previous25: [String] = []
        var previous25Int: [Int] = []
        var fullIntArray: [Int] = []
        var missingNumber = 0

        for i in contentArray {
            fullIntArray.append(Int(i) ?? 99999999999)
        }

        // Part 1
        for i in 24..<contentArray.count {
            previous25 = Array(contentArray[lineCount...lineCount + 24])

            for number in previous25 {
                previous25Int.append(Int(number) ?? 99999999999999)
            }

            let sum = Int(contentArray[i]) ?? 99999999999999

            let results = twoSum(nums: previous25Int, target: sum)

            if results == nil {
                print("Part1: \(sum)")
                missingNumber = sum
            }

            lineCount += 1
        }

        // Part 2
        let subArray = subArraySum(array: fullIntArray, sum: missingNumber)

        if subArray != [0] {
            let smallest = subArray[0]
            let largest = subArray[1]
            let added = smallest + largest

            print("Part2: \(smallest) + \(largest) = \(added)")
        }
    }
}
