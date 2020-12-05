//
//  Year 2020
//  Day03.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

class Year2020Day03 {

    var contentArray: [String] = []

    init() {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "AOCInput.bundle", relativeTo: currentDirectoryURL)
        guard let bundle = Bundle(url: bundleURL) else { fatalError("Bundle not found") }
        guard let fileURL = bundle.url(forResource: "y20d03", withExtension: "txt") else { fatalError("File not found") }
        guard let contentData = FileManager.default.contents(atPath: fileURL.path) else { fatalError("Could not get data") }
        guard let contentString = String(data: contentData, encoding: .utf8) else { fatalError("Could not get string") }
        contentArray = contentString.split(separator: "\n").map { String($0) }
    }

    func treeCount(with forest: [String], right: Int, down: Int) -> Int {
        var treeCount = 0
        var horizontalPosition = 0
        let line0skipped = forest.enumerated().compactMap { (offset, element) in
            offset % down == 0 ? element : nil
        }
        for line in line0skipped {
            if Array(line)[horizontalPosition] == "#" {
                treeCount += 1
            }
            horizontalPosition = (horizontalPosition + right) % line.count
        }
        return treeCount
    }

    func check() {
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
