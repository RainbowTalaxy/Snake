//
//  Apple.swift
//  贪吃蛇
//
//  Created by 陈大师 on 2020/4/10.
//  Copyright © 2020 陈大师. All rights reserved.
//

import Foundation

class Apple {
    
    weak var grids: Grids?
    var position: Point
    
    init(withGrids grids: Grids) {
        self.grids = grids
        self.position = grids.getValidPosition()
    }
    
    func freshPosition() {
        position = grids?.getValidPosition() ?? Point(v: 0, h: 0)
    }
    
}

