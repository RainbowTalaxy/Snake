//
//  Grids.swift
//  贪吃蛇
//
//  Created by 陈大师 on 2020/4/10.
//  Copyright © 2020 陈大师. All rights reserved.
//

import Foundation
import UIKit

class Grids {
    
    let row, column: Int
    var size: Int
    var land: UIView
    var grids: [[UIImageView]]
    var count = 0
    var notification: (() -> Void)?
    lazy var snake = Snake(withGrids: self)
    lazy var apple = Apple(withGrids: self)
    
    init(row: Int, column: Int, size: Int) {
        self.row = row
        self.column = column
        self.size = size
        
        land = UIView()
        land.frame.size = CGSize(width: column * size, height: row * size)
        
        grids = [[UIImageView]]()
        for r in 0..<row {
            var aRow = [UIImageView]()
            for c in 0..<column {
                let cell = UIImageView()
                cell.frame = CGRect(x: c * size, y: r * size, width: size, height: size)
                cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                aRow.append(cell)
                land.addSubview(cell)
            }
            grids.append(aRow)
        }
    }
    
    func restart() {
        count = 0
        notification?()
        for r in 0..<row {
            for c in 0..<column {
                grids[r][c].backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            }
        }
        snake = Snake(withGrids: self)
        apple = Apple(withGrids: self)
    }
    
    func freshColor() -> Bool {
        render(p: apple.position, color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        if !snake.isDead {
            snake.move(apple: apple)
            render(p: snake.head, color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
            for i in snake.body {
                render(p: i, color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
            }
        }
        return !snake.isDead
    }
    
    func render(p: Point, color: UIColor) {
        if validPoint(p: p) {
            grids[p.v][p.h].backgroundColor = color
        }
    }
    
    func validPoint(p: Point) -> Bool {
        return p.v >= 0 && p.h >= 0 && p.v < row && p.h < column
    }
    
    func callSnake(withDirection direction: UISwipeGestureRecognizer.Direction) {
        switch direction {
        case .left:
            snake.turn(direction: .left)
        case .right:
            snake.turn(direction: .right)
        case .up:
            snake.turn(direction: .up)
        case .down:
            snake.turn(direction: .down)
        default:
            break
        }
    }
    
    func getValidPosition() -> Point {
        while true {
            let p = Point(v: Int.random(in: 0..<row), h: Int.random(in: 0..<column))
            if !snake.inBody(p: p) {
                return p
            }
        }
    }
    
}
