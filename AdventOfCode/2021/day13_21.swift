//
//  day13_21.swift
//  AdventOfCode
//
//  Created by Greg Woods on 12/12/21.
//

import Foundation

struct Y21Day13: DayProtocol {

    typealias Fold = (horizontal: Bool, at: Int)

    func parseInput(_ input: [String]) -> (Set<Point>, [Fold]) {
        let index = input.firstIndex(of: "")!

        let grid = Set(input[0...(index-1)].map { txt -> Point in
            let parts = txt.components(separatedBy: ",")
            return Point(Int(parts[0])!, Int(parts[1])!)
        })

        let folds = input[(index+1)...].filter({ $0 != "" }).map { fold -> Fold in
            let horizontal = fold.contains("y")
            let pos = Int(fold.components(separatedBy: "=")[1])!
            return (horizontal, pos)
        }

        return (grid, folds)
    }

    func part1(_ input: [String]) -> Int {
        var (grid, folds) = parseInput(input)

        let fn = folds[0].horizontal ? foldHorizontally : foldVertically
        grid = fn(grid, folds[0].at)

        return grid.count
    }

    func foldHorizontally(grid: Set<Point>, at: Int) -> Set<Point> {
        var g: Set<Point> = []

        for y in 0...at {
            for x in 0...grid.maxX {
                let active = grid.contains(x, y) || grid.contains(x, (at * 2) - y)
                if active {
                    g.insert(Point(x, y))
                }
            }
        }

        return g
    }

    func foldVertically(grid: Set<Point>, at: Int) -> Set<Point> {
        var g: Set<Point> = []

        for y in 0...grid.maxY {
            for x in 0...at {
                let active = grid.contains(x, y) || grid.contains((at * 2) - x, y)
                if active {
                    g.insert(Point(x, y))
                }
            }
        }

        return g
    }

    func part2(_ input: [String]) -> String {
        var (grid, folds) = parseInput(input)

        for fold in folds {
            let fn = fold.horizontal ? foldHorizontally : foldVertically
            grid = fn(grid, fold.at)
        }

        return grid.toString()
    }
}
