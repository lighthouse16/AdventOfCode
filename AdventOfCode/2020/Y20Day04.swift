//
//  Year 2020
//  Day04.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

class Year2020Day04 {

    let expectedFields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    let eyeColors = Set(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"])

    var valid1 = 0
    var valid2 = 0

    func check() {
        let input = Input()
        let contentArray = input.get(fileName: "y20d04")
        let passportData = contentArray.split(separator: "")

        for passport in passportData {
            var fieldMap = [String: String]()

            passport.map { $0.split(separator: " ") }
                .reduce([], +)
                .map { $0.split(separator: ":") }
                .forEach { field in
                    fieldMap[String(field[0])] = String(field[1])
                }

            guard expectedFields.allSatisfy({ fieldMap.keys.contains($0) }) else { continue }

            // for part 1 we only care about the right fields being present.
            valid1 += 1

            // Part 2
            if let byr = fieldMap["byr"] {
                guard let intByr = Int(byr), (1920 ... 2002).contains(intByr) else { continue }
            }

            if let iyr = fieldMap["iyr"] {
                guard let intIyr = Int(iyr), (2010 ... 2020).contains(intIyr) else { continue }
            }

            if let eyr = fieldMap["eyr"] {
                guard let intEyr = Int(eyr), (2020 ... 2030).contains(intEyr) else { continue }
            }

            if let hgt = fieldMap["hgt"] {
                if hgt.hasSuffix("cm") {
                    let cms = hgt.dropLast(2)
                    guard let intCms = Int(cms), (150 ... 193).contains(intCms) else { continue }
                } else if hgt.hasSuffix("in") {
                    let ins = hgt.dropLast(2)
                    guard let intIns = Int(ins), (59 ... 76).contains(intIns) else { continue }
                } else {
                    continue
                }
            }

            if let hcl = fieldMap["hcl"] {
                guard hcl.count == 7, hcl.first == "#", hcl.dropFirst().allSatisfy({ $0.isHexDigit }) else { continue }
            }

            if let ecl = fieldMap["ecl"] {
                guard eyeColors.contains(ecl) else { continue }
            }

            if let pid = fieldMap["pid"] {
                guard pid.count == 9, pid.allSatisfy({ $0.isNumber }) else { continue }
            }

            valid2 += 1
        }

        print(valid1)
        print(valid2)
    }
}
