//
//  Year 2020
//  Day05.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

class Year2020Day05 {

    var contentArray: [String] = []
    
    init() {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "AOCInput.bundle", relativeTo: currentDirectoryURL)
        guard let bundle = Bundle(url: bundleURL) else { fatalError("Bundle not found") }
        guard let fileURL = bundle.url(forResource: "y20d05", withExtension: "txt") else { fatalError("File not found") }
        guard let contentData = FileManager.default.contents(atPath: fileURL.path) else { fatalError("Could not get data") }
        guard let contentString = String(data: contentData, encoding: .utf8) else { fatalError("Could not get string") }
        contentArray = contentString.components(separatedBy: .newlines)
    }
    
    let rows: [Int] = Array(0...127)
    let seats: [Int] = Array(0...7)
    var seatIDArray: [Int] = []
    
    func calculateSeatID(row: Int, seat: Int) -> Int {
        return (row * 8) + seat
    }

    func getRowNumber(rowData: String) -> Int {
        var tempRows: [Int] = rows
        let input = Array(rowData)
        
        for character in input {
            if character == Character("B") {
                let midpoint = tempRows.count / 2
                tempRows = Array(tempRows[midpoint...])
            } else {
                let midpoint = tempRows.count / 2
                tempRows = Array(tempRows[..<midpoint])
            }
        }
        
        return tempRows.first ?? 999
    }

    func getSeatNumber(seatData: String) -> Int {
        var tempSeats: [Int] = seats
        let input = Array(seatData)
        
        for character in input {
            if character == Character("R") {
                let midpoint = tempSeats.count / 2
                tempSeats = Array(tempSeats[midpoint...])
            } else {
                let midpoint = tempSeats.count / 2
                tempSeats = Array(tempSeats[..<midpoint])
            }
        }
        
        return tempSeats.first ?? 999
    }

    func check() {
        // Xcode adds a extra new line in every file :( so also in input.txt
        // Thats why I use this kind of for-loop instead of `for line in contentArray`
        for line in 0..<contentArray.count - 1 {
            let rowData = String(contentArray[line].prefix(7))
            let seatData = String(contentArray[line].suffix(3))

            let rowNumber = getRowNumber(rowData: rowData)
            let seatNumber = getSeatNumber(seatData: seatData)
            
            let seatID = calculateSeatID(row: rowNumber, seat: seatNumber)
            seatIDArray.append(seatID)
        }

        print("Part1: \(seatIDArray.max() ?? 999)")

        let arrayToCompareWith = Array(12...858)
        let missingID = seatIDArray.difference(from: arrayToCompareWith)

        print("Part2: \(missingID.first ?? 999)")
    }
}
