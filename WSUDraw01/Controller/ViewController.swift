//
//  ViewController.swift
//  WSUDraw01
//
//  Created by wsucatslabs on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var customView : UIView?
    let imageView = UIImageView(image: UIImage(named: "TreasureChest.jpg"))
    var originalFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalFrame = self.customView!.frame
        self.imageView.frame = originalFrame
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.autoreverse, .curveLinear],
                       animations: {
                        if let viewToMove = self.customView {
                            var frame = viewToMove.frame;
                            frame.origin.y = 400.0
                            viewToMove.frame = frame
                            viewToMove.alpha = 0.0
                            viewToMove.transform = CGAffineTransform(rotationAngle: 90.0)
                        }
                       }, completion: { Bool in
                            UIView.transition(from: self.customView!, to: self.imageView, duration: 0.5, options:[.transitionCrossDissolve]) { Bool in
                                if let viewToMove = self.customView {
                                    viewToMove.frame = self.originalFrame
                                    viewToMove.alpha = 1.0
                                    viewToMove.transform = CGAffineTransform(rotationAngle: 0.0)
                                }
                        }
                       })
        
    }
    
    @IBAction func flipBack() {
        if(nil != customView!.superview) {
            UIView.transition(from: self.customView!, to:self.imageView , duration: 0.5, options:[.transitionCurlDown]) { Bool in
            }
        } else {
            UIView.transition(from: self.imageView, to:self.customView! , duration: 0.5, options:[.transitionFlipFromBottom]) { Bool in
            }
        }
        
    }
    
}


