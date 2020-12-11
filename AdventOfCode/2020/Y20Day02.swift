//
//  Year 2020
//  Day02.swift
//  AdventOfCode
//  Lighthouse16
//
//  Day 2: Password Philosophy
//  https://adventofcode.com/2020/day/2
//

import Foundation

private struct PasswordItem {
    var firstNumber: Int
    var secondNumber: Int
    var character: String
    var password: String
}

class Year2020Day02 {

    var partOneCounter = 0
    var partTwoCounter = 0

    private func fromLineToInputItem(inputString: String) -> PasswordItem {
        let stringComponents = inputString.components(separatedBy: CharacterSet(charactersIn: "-: "))
        return PasswordItem(firstNumber: Int(stringComponents[0]) ?? 0,
                            secondNumber: Int(stringComponents[1]) ?? 0,
                            character: stringComponents[2],
                            password: stringComponents[4])
    }

    private func checkIfPasswordIsValidPartOne(item: PasswordItem) {
        let characterCount = item.password.components(separatedBy: item.character).count - 1

        if characterCount >= item.firstNumber && characterCount <= item.secondNumber {
            partOneCounter += 1
        }
    }

    private func checkIfPasswordIsValidPartTwo(item: PasswordItem) {
        let character = Character(item.character)
        let firstCharacter = Array(item.password)[item.firstNumber - 1]
        let secondCharacter = Array(item.password)[item.secondNumber - 1]

        if firstCharacter == character {
            if secondCharacter != character {
                partTwoCounter += 1
            }
        } else {
            if secondCharacter == character {
                partTwoCounter += 1
            }
        }
    }

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d02")

        for line in contentArray {
            let inputItem = fromLineToInputItem(inputString: line)
            checkIfPasswordIsValidPartOne(item: inputItem)
            checkIfPasswordIsValidPartTwo(item: inputItem)
        }

        print(partOneCounter)
        print(partTwoCounter)
    }
}
