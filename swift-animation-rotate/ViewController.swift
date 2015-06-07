//
//  ViewController.swift
//  swift-animation-rotate
//
//  Created by Hiromasa Nagamine on 5/25/15.
//  Copyright (c) 2015 hiro nagami. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    var rotateButton: UIButton!
    
    var buttonsAreaView: UIView!
    var animationAreaView: UIView?
    var animationView: UIView?
    
    static let screenSizeWidth: CGFloat = UIScreen.mainScreen().bounds.width
    
    let animationAreaWidth: CGFloat = ViewController.screenSizeWidth
    let animationAreaHeight: CGFloat = 300
    
    let buttonsAreaOriginY: CGFloat = 302
    let buttonsAreaWidth: CGFloat = ViewController.screenSizeWidth
    let buttonsAreaHeight: CGFloat = 300
    
    let buttonWidth: CGFloat = (ViewController.screenSizeWidth - 6) / 2
    let buttonHeight: CGFloat = 70
    
    let animationViewTag = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureButtons()
        configureAnimationView()
    }
    
    func DegreesToRadians(var x:Double) -> Double
    {
        return x * M_PI / 180.0
    }
    
    func configureButtons()
    {
        rotateButton = UIButton(frame: CGRectMake(2, 2, buttonsAreaWidth, buttonsAreaHeight))
        rotateButton.backgroundColor = .lightGrayColor()
        rotateButton.setTitle("Rotate", forState: .Normal)
        rotateButton.addTarget(self, action: Selector("rotateAction"), forControlEvents: UIControlEvents.TouchUpInside)
        
        buttonsAreaView = UIView(frame: CGRectMake(0, buttonsAreaOriginY, buttonsAreaWidth, buttonsAreaHeight))
        
        buttonsAreaView.addSubview(rotateButton)
        
        view.addSubview(buttonsAreaView)
    }
    
    func configureAnimationView()
    {
        if let _animationAreaView = animationAreaView {
            animationView?.removeFromSuperview()
            animationView = makeAnimationView()
            _animationAreaView.addSubview(animationView!)
        }
        else {
            animationAreaView = UIView(frame: CGRectMake(0, 0, animationAreaWidth, animationAreaHeight))
            animationAreaView!.layer.borderColor = UIColor.greenColor().CGColor
            animationAreaView!.layer.borderWidth = 1
            
            animationView = makeAnimationView()
            
            animationAreaView!.addSubview(animationView!)
            
            view.addSubview(animationAreaView!)
        }
    }
    
    func makeAnimationView() -> UIView! {
        var animationView = UIView(frame: CGRectMake(0, 0, 100, 100))
        animationView.backgroundColor = UIColor.blueColor()
        animationView.center = CGPointMake(animationAreaView!.bounds.size.width / 2, animationAreaView!.bounds.size.height / 2)
        animationView.tag = animationViewTag
        return animationView
    }
    
    func rotateAction()
    {
        if let _animationView = animationView {
            var viewCenter = _animationView.center
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                _animationView.transform = CGAffineTransformMakeRotation(CGFloat(self.DegreesToRadians(180.0)))
                }){ (isTrue) -> Void in
                    self.configureAnimationView()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
