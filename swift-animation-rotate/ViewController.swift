//
//  ViewController.swift
//  swift-animation-rotate
//
//  Created by Hiromasa Nagamine on 5/25/15.
//  Copyright (c) 2015 hiro nagami. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //------------- 初期化 ------------//
    
    // ビュー
    var rotateButton: UIButton!
    var buttonsAreaView: UIView!
    var animationAreaView: UIView?
    var animationView: UIView!
    
    // 各ビューのサイズ
    static let screenSizeWidth: CGFloat = UIScreen.mainScreen().bounds.width
    let animationAreaWidth: CGFloat = ViewController.screenSizeWidth
    let animationAreaHeight: CGFloat = 300
    let buttonWidth: CGFloat = 150
    let buttonHeight: CGFloat = 70
    let animationViewTag = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureAnimationView()
        configureButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 回転角度 (degree)
    func DegreesToRadians(var degree:Double) -> CGFloat
    {
        return CGFloat(degree * M_PI / 180.0)
    }
    
    // アニメーションエリアの初期化
    func configureAnimationView()
    {
        if let _animationAreaView = animationAreaView {
            animationView?.removeFromSuperview()
            animationView = makeAnimationView()
            _animationAreaView.addSubview(animationView!)
        }
        else {
            animationAreaView = UIView(frame: CGRectMake(0, 100, animationAreaWidth, animationAreaHeight))
            
            animationView = makeAnimationView()
            animationAreaView!.addSubview(animationView!)
            
            view.addSubview(animationAreaView!)
        }
    }
    
    // ボタンの配置
    func configureButtons()
    {
        rotateButton = UIButton(frame: CGRectMake(0, 0, buttonWidth, buttonHeight))
        rotateButton.backgroundColor = .lightGrayColor()
        rotateButton.setTitle("Rotate", forState: .Normal)
        rotateButton.addTarget(self, action: Selector("rotateAction"), forControlEvents: UIControlEvents.TouchUpInside)
        rotateButton.center = CGPointMake(self.view.center.x, animationAreaView!.frame.maxY + 50)
        
        view.addSubview(rotateButton)
    }
    
    // アニメーションするビューの生成
    func makeAnimationView() -> UIView! {
        var animationView = UIView(frame: CGRectMake(0, 0, 100, 100))
        animationView.backgroundColor = UIColor.blueColor()
        animationView.center = CGPointMake(animationAreaView!.bounds.size.width / 2, animationAreaView!.bounds.size.height / 2)
        animationView.tag = animationViewTag
        return animationView
    }
    
    
    
    
    //------------- アニメーション ------------//
    
    // 回転
    func rotateAction()
    {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            // 180度回転するtransformの生成// 180度回転するtransformの生成
            // * 回転角度(radian)を生成する関数(120度の場合): self.DegreesToRadians(120)
            // * RotateTransformの生成: CGAffineTransformMakeRotation(radian)
            var radian      = self.DegreesToRadians(180.0)
            var transform   = CGAffineTransformMakeRotation(radian)
            
            // animationViewにtransformを設定
            self.animationView.transform = transform
            
        }){ (isTrue) -> Void in
            
            // animationViewを初期化
            self.configureAnimationView()
        }
    }
    
    //--------------------------------------//

}
