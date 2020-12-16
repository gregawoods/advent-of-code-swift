//
//  Day15Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Greg Woods on 12/15/20.
//

import XCTest

@testable import AdventOfCode2020

class Day15Tests: XCTestCase {

    let day = Day15()
    let sample = [0, 3, 6]
    let input = [9, 3, 1, 0, 8, 4]

    func testPart1Sample() {
        let result = day.calculatePart1(sample)
        XCTAssertEqual(result, 436)
    }

    func testPart1() throws {
        let result = day.calculatePart1(input)
        print("Day 15 Part 1: \(result)")
        XCTAssertEqual(result, 371)
    }

    func testPart2Sample() {
        let result = day.calculatePart2(sample)
        XCTAssertEqual(result, 0)
    }

    func testPart2() throws {
        let result = day.calculatePart2(input)
        print("Day 15 Part 2: \(result)")
        XCTAssertEqual(result, 0)
    }
}
