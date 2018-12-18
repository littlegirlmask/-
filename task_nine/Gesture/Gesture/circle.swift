//
//  circle.swift
//  Gesture
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hrl. All rights reserved.
//

import UIKit
@IBDesignable
class circle: UIView{

    func setup(){
        self.layer.shadowColor=UIColor.gray.cgColor
        self.layer.shadowOffset=CGSize(width: 5, height: 5)
        self.layer.shadowOpacity=0.8
        
        let panRecognizer=UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        let pinchRecognizer=UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer: )))
        self.addGestureRecognizer(pinchRecognizer)
        
        let tapRecognizer=UITapGestureRecognizer(target: self, action: #selector(tap(recognizer: )))
        self.addGestureRecognizer(tapRecognizer)
        
        let rotationRecognizer=UIRotationGestureRecognizer(target: self, action: #selector(rotation(recognizer: )))
        self.addGestureRecognizer(rotationRecognizer)
    }

    //移动
    @objc func pan(recognizer:UIPanGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            let translation = recognizer.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        }
    }
    //缩放
    @objc func pinch(recognizer:UIPinchGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            bounds = CGRect(x:0,y:0,width:bounds.width * recognizer.scale,height:bounds.height * recognizer.scale)
            recognizer.scale = 1
        }
    }
    //删除
    @objc func tap(recognizer:UITapGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            recognizer.view?.removeFromSuperview()
        }
    }
    //旋转
    @objc func rotation(recognizer:UIRotationGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            let rotation = recognizer.rotation
            self.transform = self.transform.rotated(by: rotation)
            recognizer.rotation=0
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        let redColor = CGFloat(Float(arc4random() % 255) / 255)
        let greenColor = CGFloat(Float(arc4random() % 255) / 255)
        let blueColor = CGFloat(Float(arc4random() % 255) / 255)
        UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0).set()
        path.stroke()
        path.fill()
    }
}
