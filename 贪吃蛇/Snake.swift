//
//  Snake.swift
//  贪吃蛇
//
//  Created by 陈大师 on 2020/4/10.
//  Copyright © 2020 陈大师. All rights reserved.
//

import Foundation

class Snake {
    
    weak var grids: Grids?
    var head: Point
    var body = [Point]()
    var direction = Direction.random
    
    init(withGrids grids: Grids) {
        self.grids = grids
        let tail = Point(v: grids.row / 2, h: grids.column / 2)
        head = Point(v: tail.v + direction.v, h: tail.h + direction.h)
        body.append(tail)
    }
    
    func move(apple: Apple) {
        body.insert(head, at: 0)
        head = Point(v: body[0].v + direction.v, h: body[0].h + direction.h)
        if head != apple.position {
            grids?.render(p: body.removeLast(), color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            grids?.count += 1
            grids?.notification?()
            apple.freshPosition()
        }
    }
    
    func turn(direction: Direction) {
        if self.direction.reverseDirection != direction {
            self.direction = direction
        }
    }
    
    func inBody(p: Point) -> Bool {
        for i in body {
            if p == i {
                return true
            }
        }
        return false
    }
    
    var isDead: Bool {
        if inBody(p: head) {
            return true
        }
        return !(grids?.validPoint(p: head) ?? true)
    }
}
