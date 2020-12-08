//
//  Year 2020
//  Day02.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

struct InputItem {
    var firstNumber: Int
    var secondNumber: Int
    var character: String
    var password: String
}

class Year2020Day02 {

    var partOneCounter = 0
    var partTwoCounter = 0

    func fromLineToInputItem(inputString: String) -> InputItem {
        let stringComponents = inputString.components(separatedBy: CharacterSet(charactersIn: "-: "))
        return InputItem(firstNumber: Int(stringComponents[0]) ?? 0,
                         secondNumber: Int(stringComponents[1]) ?? 0,
                         character: stringComponents[2],
                         password: stringComponents[4])
    }

    func checkIfPasswordIsValidPartOne(item: InputItem) {
        let characterCount = item.password.components(separatedBy: item.character).count - 1

        if characterCount >= item.firstNumber && characterCount <= item.secondNumber {
            partOneCounter += 1
        }
    }

    func checkIfPasswordIsValidPartTwo(item: InputItem) {
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
