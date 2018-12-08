//
//  MALogoView.swift
//  MALogo
//
//  Created by Volodymyr Lavryk on 12/8/18.
//  Copyright © 2018 Volodymyr Lavryk. All rights reserved.
//

import UIKit

class MALogoView: UIView {

    override func draw(_ rect: CGRect) {
        
        func createShapeLayer(path: UIBezierPath, lineWidth: CGFloat) -> CAShapeLayer {
            let shape = CAShapeLayer()
            shape.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
            shape.strokeColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).cgColor
            shape.lineWidth = lineWidth
            shape.path = path.cgPath
            return shape
        }
        
        func  animation() -> CAAnimation {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0.0
            animation.toValue = 1
            animation.duration = 2
            return animation
        }
        
        let frameHeight = bounds.height
        let frameWidth = bounds.width
        let lineWidth: CGFloat = frameWidth / 30
        let centerWidth = frameWidth / 2
        let centerHeigth = frameHeight / 2
        
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: centerWidth, y: centerHeigth - 130))
        triangle.addLine(to: CGPoint(x: centerWidth + 95, y: centerHeigth + 70))
        triangle.addLine(to: CGPoint(x: centerWidth - 95, y: centerHeigth + 70))
        triangle.close()
        
        let mLetter = UIBezierPath()
        mLetter.move(to: CGPoint(x: centerWidth, y: centerHeigth))
        mLetter.addLine(to: CGPoint(x: centerWidth + 100, y: centerHeigth - 80))
        mLetter.addLine(to: CGPoint(x: centerWidth + 100, y: centerHeigth + 70))
        mLetter.addLine(to: CGPoint(x: centerWidth - 100, y: centerHeigth + 70))
        mLetter.addLine(to: CGPoint(x: centerWidth - 100, y: centerHeigth - 80))
        mLetter.close()
        
        let triangleShape = createShapeLayer(path: triangle, lineWidth: lineWidth)
        let mLetterShape  = createShapeLayer(path: mLetter, lineWidth: lineWidth)
        
        layer.addSublayer(triangleShape)
        layer.addSublayer(mLetterShape)
        
        triangleShape.add(animation(), forKey: "animation")
        mLetterShape.add(animation(), forKey: "animation")
    }
}
