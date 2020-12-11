//
//  Year 2020
//  Day08.swift
//  AdventOfCode
//  Lighthouse16
//
//  Day 8: Handheld Halting
//  https://adventofcode.com/2020/day/8
//

import Foundation

private struct Instruction {
    var name: Name
    var value: Int
}

private enum Name: String {
    case acc
    case nop
    case jmp
}

class Year2020Day08 {
    var accArray: [Int] = []

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d08")

        let instructions: [Instruction] = contentArray.map { i in
            let parts = i.components(separatedBy: " ")
            let name = Name(rawValue: parts[0])
            let value = Int(parts[1]) ?? 9999
            // swiftlint:disable force_unwrapping
            return Instruction(name: name!, value: value)
        }

        var line = 0

        while !loopThroughInstructions(line: line, instructions: instructions) {
            line += 1
        }
    }

    private func loopThroughInstructions(line: Int, instructions: [Instruction]) -> Bool {
        var acc = 0

        var run: Set<Int> = []
        var currentLine = 0
        var instructions = instructions

        if instructions[line].name == .nop {
            instructions[line].name = .jmp
        } else if instructions[line].name == .jmp {
            instructions[line].name = .nop
        } else {
            return false
        }

        while currentLine < instructions.count {
            if run.contains(currentLine) {
                self.accArray.append(acc)
                return false
            }

            run.insert(currentLine)

            let instruction = instructions[currentLine]

            switch instruction.name {
            case .nop:
                currentLine += 1
            case .acc:
                acc += instruction.value
                currentLine += 1
            case .jmp:
                currentLine += instruction.value
            }
        }

        print("Part1: \(self.accArray.last ?? 9999)")
        print("Part2: \(acc)")
        return true
    }
}
