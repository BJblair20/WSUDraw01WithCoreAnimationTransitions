//
//  WSUCustomView.swift
//  WSUDraw01
//
//  Created by wsucatslabs on 10/1/21.
//

import UIKit

class WSUCustomView : UIView {
    var clipPath : UIBezierPath?
    var clipPath2 : UIBezierPath?
    var smallRect = CGRect(x: 50, y: 60, width: 20, height: 50)
    var smallRect2 = CGRect(x: 200, y: 60, width: 20, height: 50)
    var directionSign = CGFloat(1.0)
    var speed = CGFloat(1.0)
    
    func moveSmallRect() {
        if(smallRect.maxY >= bounds.maxY || smallRect.minY < bounds.minY+60) {
            directionSign *= -1
        }
        smallRect.origin.y += speed * directionSign
        smallRect2.origin.y += speed * directionSign
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0/60.0) {
            self.moveSmallRect()
        }
        let path = UIBezierPath(ovalIn: bounds)
        clipPath = UIBezierPath(roundedRect: smallRect, cornerRadius: 5.0)
        clipPath2 = UIBezierPath(roundedRect: smallRect2, cornerRadius: 5.0)
        UIColor.gray.set()
        UIColor.black.setFill()
        path.lineWidth = 40.0
        path.stroke()
        path.fill()
        clipPath!.stroke()
        clipPath2!.stroke()
    }
    
    @IBAction func takeSpeedFrom(slider : UISlider) {
        speed = CGFloat(slider.value)
    }
}
