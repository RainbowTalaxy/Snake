//
//  extensions.swift
//  贪吃蛇
//
//  Created by 陈大师 on 2020/4/10.
//  Copyright © 2020 陈大师. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static var random: UIColor {
        UIColor.init(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: CGFloat.random(in: 0...1)
        )
    }
}

var screenCenter: CGPoint {
    CGPoint(
        x: UIScreen.main.bounds.size.width / 2,
        y: UIScreen.main.bounds.size.height / 2
    )
}

var maxLength: CGFloat {
    return max(screenWidth, screenHeight)
}

var screenWidth: CGFloat {
    UIScreen.main.bounds.size.width
}

var screenHeight: CGFloat {
    UIScreen.main.bounds.size.height
}

extension UILabel {
    
    func autoFontSize() {
        let num = text?.count ?? 0
        if num < 13 {
            font = font.withSize(50)
        } else if num < 15 {
            font = font.withSize(42)
        } else if num < 17 {
            font = font.withSize(35)
        } else if num < 20 {
            font = font.withSize(30)
        } else {
            font = font.withSize(25)
        }
    }
}

extension UIView {
    
    func setFrameByCenter(point: CGPoint) {
        frame.origin.x = point.x - frame.size.width / 2
        frame.origin.y = point.y - frame.size.height / 2
    }
    
    var center: CGPoint {
        CGPoint(x: frame.size.width / 2 + frame.origin.x,
                y: frame.size.height / 2 + frame.origin.y
        )
    }
    
    var theX: CGFloat {
        frame.origin.x
    }
    
    var theY: CGFloat {
        frame.origin.y
    }
    
    var theW: CGFloat {
        frame.size.width
    }
    
    var theH: CGFloat {
        frame.size.height
    }
}
