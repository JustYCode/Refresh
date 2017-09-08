//
//  CircleProgressButton.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/20.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class CircleProgressButton: UIButton,CAAnimationDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    typealias ProgressBack = ()-> ()
    var finishProgress:ProgressBack?
    
    var trackColor:UIColor?
    var progressColor:UIColor?
    var fillColor:UIColor?
    var lineWidth:CGFloat = 2
    var animationDuration:CGFloat = 5
    
    var trackLayer:CAShapeLayer?
    var progressLayer:CAShapeLayer?
    var bezierPath:UIBezierPath?

    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.layer.addSublayer(getTrackLayer())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func degreesToRadians(_ x:Double)->CGFloat{
        return CGFloat(x * M_PI)/180.0
    }
    
    
    func getBezierPath() ->UIBezierPath{
        
        if(bezierPath == nil){
            let width = self.frame.width/2.0
            let height = self.frame.height/2.0
            let centerPoint = CGPoint(x: width, y: height)
            let radius = self.frame.width/2.0
            
            bezierPath = UIBezierPath.init(arcCenter: centerPoint, radius: radius, startAngle: degreesToRadians(-90), endAngle: degreesToRadians(270), clockwise: true)
            
        }
        
        return bezierPath!
    }
    
    func getTrackLayer() -> CAShapeLayer{
        if (trackLayer == nil) {
            trackLayer = CAShapeLayer.init()
            trackLayer?.frame = self.bounds
            if(self.fillColor != nil){
                trackLayer?.fillColor = self.fillColor?.cgColor
            }else{
                trackLayer?.fillColor  = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.2).cgColor
            }
            
            if(self.trackColor != nil){
               trackLayer?.strokeColor = self.trackColor?.cgColor
            }else{
                trackLayer?.strokeColor = UIColor.clear.cgColor
            }
 
             trackLayer?.lineWidth = self.lineWidth
             trackLayer?.strokeStart = 0;
             trackLayer?.strokeEnd = 1;
             trackLayer?.path =  getBezierPath().cgPath;
        }
        return trackLayer!;
    }
    
    
    func getProgressLayer() -> CAShapeLayer{
        if(progressLayer == nil){
            progressLayer = CAShapeLayer.init()
            progressLayer?.frame = self.bounds;
            progressLayer?.fillColor = UIColor.clear.cgColor
            progressLayer?.lineWidth = self.lineWidth
            progressLayer?.lineCap = kCALineCapRound;
            if(self.progressColor != nil){
                progressLayer?.strokeColor = self.progressColor?.cgColor
            }else{
                progressLayer?.strokeColor = UIColor.red.cgColor
            }
            progressLayer?.strokeStart = 0
            
            let pathAnimation = CABasicAnimation.init(keyPath: "strokeStart")
            pathAnimation.duration = CFTimeInterval(self.animationDuration);
            
            pathAnimation.fromValue = 0
            pathAnimation.toValue = 1;
            pathAnimation.isRemovedOnCompletion = true;
            pathAnimation.delegate = self
            progressLayer?.add(pathAnimation, forKey: nil)

            progressLayer?.path = getBezierPath().cgPath;
        }
        
        return progressLayer!
    }
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if(flag){
            self.finishProgress!()
        }
    }
    
    func startAnimationDuration(duration:CGFloat,block:@escaping ProgressBack){
        self.finishProgress = block
        self.animationDuration = duration
        self.layer.addSublayer(getProgressLayer())
    }
    
    
    

}
