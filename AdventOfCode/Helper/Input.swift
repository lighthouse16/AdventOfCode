//
//  Input.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

class Input {
    func get(fileName: String) -> [String] {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "AOCInput.bundle", relativeTo: currentDirectoryURL)
        guard let bundle = Bundle(url: bundleURL) else { fatalError("Bundle not found") }
        guard let fileURL = bundle.url(forResource: fileName, withExtension: "txt") else { fatalError("File not found") }
        guard let contentData = FileManager.default.contents(atPath: fileURL.path) else { fatalError("Could not get data") }
        guard let contentString = String(data: contentData, encoding: .utf8) else { fatalError("Could not get string") }
        var contentArray = contentString.components(separatedBy: .newlines)
        _ = contentArray.popLast() // Last blank line added by Xcode is removed here
        return contentArray
    }
}
