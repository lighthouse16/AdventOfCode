//
//  Year 2020
//  Day06.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

extension Array where Element: Hashable {
    var uniques: Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}

extension Sequence where Element: Hashable {
    var frequency: [Element: Int] { reduce(into: [:]) { $0[$1, default: 0] += 1 } }
}

class Year2020Day06 {
    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d06")
        let groups = contentArray.split(separator: "")

        var answeredYes: [Int] = []
        var answeredByAllInGroup = 0

        for group in groups {
            var characters: [Character] = []

            for person in group {
                let array = Array(person)
                for character in array {
                    characters.append(character)
                }
            }

            let uniqueCharacters = characters.uniques
            answeredYes.append(uniqueCharacters.count)

            for (_, value) in characters.frequency where value == group.count {
                answeredByAllInGroup += 1
            }
        }

        let part1Sum = answeredYes.reduce(0, +)

        print("Part1: \(part1Sum)")
        print("Part2: \(answeredByAllInGroup)")
    }
}
