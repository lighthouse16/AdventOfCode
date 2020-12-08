//
//  Year 2020
//  Day03.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

class Year2020Day03 {

    func treeCount(with forest: [String], right: Int, down: Int) -> Int {
        var treeCount = 0
        var horizontalPosition = 0
        let moveDown = forest.enumerated().compactMap { (offset, element) in
            offset % down == 0 ? element : nil
        }
        for line in moveDown {
            if Array(line)[horizontalPosition] == "#" {
                treeCount += 1
            }
            horizontalPosition = (horizontalPosition + right) % line.count
        }
        return treeCount
    }

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d03")

        let part1 = treeCount(with: contentArray, right: 3, down: 1)
        let part2 = treeCount(with: contentArray, right: 1, down: 1) *
                    treeCount(with: contentArray, right: 3, down: 1) *
                    treeCount(with: contentArray, right: 5, down: 1) *
                    treeCount(with: contentArray, right: 7, down: 1) *
                    treeCount(with: contentArray, right: 1, down: 2)

        print(part1)
        print(part2)
    }
}
