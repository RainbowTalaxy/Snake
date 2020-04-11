//
//  Position.swift
//  贪吃蛇
//
//  Created by 陈大师 on 2020/4/10.
//  Copyright © 2020 陈大师. All rights reserved.
//

import Foundation

class Point: Equatable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.v == rhs.v && lhs.h == rhs.h
    }
    
    var v, h: Int
    
    init(v: Int, h: Int) {
        self.v = v
        self.h = h
    }
}

enum Direction: String {
    case up, right, down, left
    
    static var random: Direction {
        [Direction.up, .down, .left, .right].randomElement()!
    }
    
    var h: Int {
        switch self {
        case .left:
            return -1
        case .right:
            return 1
        default:
            return 0
        }
    }
    
    var v: Int {
        switch self {
        case .up:
            return -1
        case .down:
            return 1
        default:
            return 0
        }
    }
    
    var reverseDirection: Direction {
        switch self {
        case .left:
            return .right
        case .right:
            return .left
        case .up:
            return .down
        case .down:
            return .up
        }
    }
}
