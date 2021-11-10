//
//  WSUCustomView.swift
//  WSUDraw01
//
//  Created by wsucatslabs on 10/1/21.
//

import UIKit

class WSUCustomView : UIView {
    var clipPath : UIBezierPath?
    var smallRect = CGRect(x: 0, y: 0, width: 200, height: 200)
    var directionSign = CGFloat(1.0)
    var speed = CGFloat(1.0)
    
    func moveSmallRect() {
        if(smallRect.maxX >= bounds.maxX || smallRect.minX < bounds.minX) {
            directionSign *= -1
        }
        smallRect.origin.x += speed * directionSign
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0/60.0) {
            self.moveSmallRect()
        }
        let path = UIBezierPath(ovalIn: bounds)
        clipPath = UIBezierPath(ovalIn: smallRect)
        UIColor.black.set()
        UIColor.white.setFill()
        path.lineWidth = 40.0
        path.stroke()
        path.fill()
        clipPath!.stroke()
    }
    
    @IBAction func takeSpeedFrom(slider : UISlider) {
        speed = CGFloat(slider.value)
    }
}
