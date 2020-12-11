//
//  Year 2020
//  Day10.swift
//  AdventOfCode
//  Lighthouse16
//
//  Day 10: Adapter Array
//  https://adventofcode.com/2020/day/10
//

import Foundation

class Year2020Day10 {

    var memory: [Int: Int64] = [:]
    var numbers: [Int] = []

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d10")

        for line in contentArray {
            numbers.append(Int(line) ?? 9999)
        }

        // Part 1
        numbers.sort()
        let p1 = part1(numbers: numbers)
        print("Part1: \(p1)")

        // Part 2
        let highest = numbers[numbers.count - 1]
        numbers.append(highest + 3)
        numbers.append(0)
        numbers.sort()

        let p2 = part2(x: 0)
        print("Part2: \(p2)")
    }

    private func part1(numbers: [Int]) -> Int {
        var n1 = 0
        var n3 = 1
        var previous = 0

        for i in numbers {
            if i - previous == 1 {
                n1 += 1
            }
            if i - previous == 3 {
                n3 += 1
            }
            previous = i
        }

        return n1 * n3
    }

    private func part2(x: Int) -> Int64 {
        var sum: Int64 = 0
        if memory[x] != nil {
            // swiftlint:disable force_unwrapping
            return memory[x]!
        }

        if x == numbers.count - 1 {
            return 1
        }

        for i in x + 1..<numbers.count {
            if numbers[i] - numbers[x] <= 3 {
                let nums = part2(x: i)
                sum += nums
                memory[i] = nums
            } else {
                break
            }
        }
        return sum
    }
}
