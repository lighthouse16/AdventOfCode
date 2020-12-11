//
//  Year 2020
//  Day07.swift
//  AdventOfCode
//  Lighthouse16
//
//  Day 7: Handy Haversacks
//  https://adventofcode.com/2020/day/7
//

import Foundation
// swiftlint:disable all
private struct Rule {
    let colour: String
    let contents: [(colour: String, count: Int)]

    init(string: String) {
        let parts = string.components(separatedBy: " bags contain ")
        self.colour = parts[0]
        if parts[1] == "no other bags." {
            self.contents = []
            return
        }
        let contains = parts[1].components(separatedBy: ", ")
        self.contents = contains.map { item in
            let words = item.components(separatedBy: " ")
            return ("\(words[1]) \(words[2])", Int(words[0])!)
        }
    }
}

class Year2020Day07 {
    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d07")

        // Part 1
        let rulesPart1 = contentArray.map(Rule.init)

        var containedBy = [String: [String]]()
        rulesPart1.forEach { rule in
            rule.contents.forEach { colour, count in
                let inside = containedBy[colour, default: []]
                containedBy[colour] = inside + [rule.colour]
            }
        }

        var queuePart1 = containedBy["shiny gold"]!
        var processedBags = Set<String>()
        var outermostBags = [String]()

        while !queuePart1.isEmpty {
            let bag = queuePart1.removeFirst()
            if rulesPart1.contains(where: { $0.colour == bag }) {
                outermostBags.append(bag)
            }
            for container in containedBy[bag, default: []] {
                if !processedBags.contains(container) && !queuePart1.contains(container) {
                    queuePart1.append(container)
                }
            }
            processedBags.insert(bag)
        }

        print("Part1: \(outermostBags.count)")

        // Part 2
        let rulesPart2 = contentArray.map(Rule.init).reduce(into: [String: Rule](), { $0[$1.colour] = $1 })
        var countBagsPart2 = 0
        var queuePart2 = [(rule: rulesPart2["shiny gold"]!, multiplier: 1)]
        while !queuePart2.isEmpty {
            let (rule, multiplier) = queuePart2.removeFirst()
            rule.contents.forEach { colour, count in
                countBagsPart2 += count * multiplier
                queuePart2.append((rulesPart2[colour]!, count * multiplier))
            }
        }

        print("Part2: \(countBagsPart2)")
    }
}
