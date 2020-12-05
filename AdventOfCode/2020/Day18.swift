//
//  Year 2020
//  Day18.swift
//  AdventOfCode
//  Lighthouse16
//

import Foundation

class Year2020Day18 {

    var contentArray: [String] = []
    
    init() {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "AOCInput.bundle", relativeTo: currentDirectoryURL)
        guard let bundle = Bundle(url: bundleURL) else { fatalError("Bundle not found") }
        guard let fileURL = bundle.url(forResource: "y20d18", withExtension: "txt") else { fatalError("File not found") }
        guard let contentData = FileManager.default.contents(atPath: fileURL.path) else { fatalError("Could not get data") }
        guard let contentString = String(data: contentData, encoding: .utf8) else { fatalError("Could not get string") }
        contentArray = contentString.components(separatedBy: .newlines)
    }

    func check() {
        
    }
}
