//
//  ViewController.swift
//  贪吃蛇
//
//  Created by 陈大师 on 2020/4/10.
//  Copyright © 2020 陈大师. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        button.sizeToFit()
        
        grids.land.setFrameByCenter(point: CGPoint(x: screenWidth / 2, y: screenHeight / 2))
        if screenHeight < grids.land.theH + button.theH + score.theH {
            button.setFrameByCenter(
                point: CGPoint(x: (grids.land.theX + grids.land.theW + screenWidth) / 2, y: grids.land.center.y)
            )
        } else {
            button.setFrameByCenter(
                point: CGPoint(x: grids.land.center.x, y: (grids.land.theY + grids.land.theH + screenHeight) / 2)
            )
        }
        
        freshText()
    }
    
    @objc func startGame() {
        button.isHidden = true
        grids.restart()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var flag = true
            while flag {
                DispatchQueue.main.sync {
                    flag = self?.grids.freshColor() ?? false
                }
                Thread.sleep(forTimeInterval: 0.15)
            }
            DispatchQueue.main.async {
                self?.button.isHidden = false
            }
        }
    }
    
    func freshText() {
        if screenHeight < grids.land.theH + button.theH + score.theH {
            score.text = "\n分数\n\(grids.count)"
            score.setFrameByCenter(
                point: CGPoint(x: (grids.land.theX + 0) / 2, y: grids.land.center.y)
            )
        } else {
            score.text = "\n分数：\(grids.count)"
            score.setFrameByCenter(
                point: CGPoint(x: grids.land.center.x, y: (grids.land.theY + 0) / 2)
            )
        }
    }
    
    var score = UITextView()
    var grids = Grids(row: Int(maxLength / 40), column: Int(maxLength / 40), size: 20)
    var button = UIButton()
    
    @objc func callGrids(_ sender: Any) {
        grids.callSnake(withDirection: (sender as! UISwipeGestureRecognizer).direction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grids.notification = freshText
        
        view.addSubview(score)
        view.addSubview(grids.land)
        view.addSubview(button)
        
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        score.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        score.font = .systemFont(ofSize: 30)
        score.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        score.isEditable = false
        score.isSelectable = false
        score.text = "00000\n分数：00000\n00000"
        score.textAlignment = .center
        score.sizeToFit()
        
        button.setTitle(" 开始游戏 ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        button.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        button.layer.cornerRadius = 10
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(callGrids))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(callGrids))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(callGrids))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(callGrids))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }

}
