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
        
        //animate S117's head movement
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.autoreverse, .curveLinear,.repeat],
                       animations: {
                        if let viewToMove = self.customView {
                            var frame = viewToMove.frame;
                            frame.origin.y = 50.0
                            viewToMove.frame = frame
                            viewToMove.alpha = 0.2
                            
                        }
                        //this code will never be reached because S117's animation repeats, but stuff acts weird if I remove it, so in it shall stay. 
                       }, completion: { Bool in
                            UIView.transition(from: self.customView!, to: self.imageView, duration: 0.5, options:[.transitionCrossDissolve]) { Bool in
                                if let viewToMove = self.customView {
                                    viewToMove.frame = self.originalFrame
                                    viewToMove.alpha = 1.0
                                    
                                }
                        }
                       })
        
    }
    
    //button controls to change scene views
    @IBAction func flipBack() {
        if(nil != customView!.superview) {
            UIView.transition(from: self.customView!, to:self.imageView , duration: 0.5, options:[.transitionCurlDown]) { Bool in
            }
        } else {
            UIView.transition(from: self.imageView, to:self.customView! , duration: 0.5, options:[.transitionFlipFromBottom]) { Bool in
            }
            viewDidLoad() //allows animation to continue after returning from second scene view
        }
        
    }
    
}


