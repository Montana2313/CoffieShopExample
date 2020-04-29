//
//  customShapes.swift
//  Template
//
//  Created by Mac on 4.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit
class customShapes: UIView {
    private var shapeType : CustomShapes = .Rectangle
    private var fillColor : UIColor = .black
    let shapeLayer : CAShapeLayer = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.setConfing()
    }
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    private func setConfing(){
        self.backgroundColor = .clear
        self.layer.addSublayer(self.shapeLayer)
        self.setup()
    }
    func setup(fillColor fColor:UIColor? = nil,shapeType:CustomShapes? = nil){
           if let color = fColor{
                self.fillColor = color
           }
        if let shape  = shapeType{
            self.shapeType = shape
        }
         setShape()
     }
    func setShape(){
        self.shapeLayer.path = createShapeBezier().cgPath
        self.shapeLayer.fillColor = self.fillColor.cgColor
    }
    
    func animate(){
        let bezier = createShapeBezier()
        bezier.apply(CGAffineTransform(scaleX: 2, y: 1))
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 2
        animation.toValue = bezier.cgPath
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.delegate = self
        self.shapeLayer.add(animation, forKey: "path")
    }
    private func createShapeBezier()->UIBezierPath{
        var bezierPath = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: self.frame.size.width - 20, height: self.frame.size.height - 20), cornerRadius: 10.0)
        if self.shapeType == .Rectangle{
            bezierPath = UIBezierPath(rect: CGRect(x: 10, y: 10, width: self.frame.size.width - 20, height: self.frame.size.height - 20))
        }else if self.shapeType == .Circle {
            bezierPath = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width:self.frame.size.width - 20 , height:self.frame.size.height - 20  ))
        }else if self.shapeType == .diamond {
            bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: (self.frame.size.width / 2 ), y:10))
            bezierPath.addLine(to: CGPoint(x: self.frame.size.width - 20, y: (self.frame.size.height / 2) - 20))
            bezierPath.addLine(to: CGPoint(x: (self.frame.size.width / 2 ), y:self.frame.size.height - 20))
            bezierPath.addLine(to: CGPoint(x:10, y: (self.frame.size.height / 2 ) - 20))
            bezierPath.close()
        }else if self.shapeType == .Triangle {
            bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: (self.frame.size.width / 2 ), y:10))
            bezierPath.addLine(to: CGPoint(x: self.frame.size.width - 20, y: self.frame.size.height - 20))
            bezierPath.addLine(to: CGPoint(x: 10, y: self.frame.size.height - 20))
            bezierPath.close()
        }else if self.shapeType == .Custom{
            bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: (self.frame.size.width / 2 ), y:10))
            // 2 kontrol noktalı bezier eğrisi
            bezierPath.addCurve(to: CGPoint(x: 150, y: 150), controlPoint1: CGPoint(x: 20, y: 20), controlPoint2: CGPoint(x: 100, y: 250))
        }
        return bezierPath
    }
}
extension customShapes:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag{
         // yerini update et
        }
    }
}
