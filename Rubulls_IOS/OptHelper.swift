//
//  Helper.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/3/18.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

typealias CancelableTask = (_ cancel: Bool) -> Void

//包含
extension String {
    
    func contains(_ find: String) -> Bool{
        return self.range(of: find) != nil
    }
}

//延迟执行
func delay(_ time: TimeInterval, work: @escaping ()->()) -> CancelableTask? {
    
    var finalTask: CancelableTask?
    
    let cancelableTask: CancelableTask = { cancel in
        if cancel {
            finalTask = nil // key
            
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
    
    finalTask = cancelableTask
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
        if let task = finalTask {
            task(false)
        }
    }
    
    return finalTask
}

func cancel(_ cancelableTask: CancelableTask?) {
    cancelableTask?(true)
}




func isOperatingSystemAtLeastMajorVersion(_ majorVersion: Int) -> Bool {
    return ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: majorVersion, minorVersion: 0, patchVersion: 0))
}

extension String {
    func stringByAppendingPathComponent(_ path: String) -> String {
        return (self as NSString).appendingPathComponent(path)
    }
}


func cleanDiskCacheFolder() {
    
    let folderPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    let fileMgr = FileManager.default
    
    guard let fileArray = try? fileMgr.contentsOfDirectory(atPath: folderPath) else {
        return
    }
    
    for filename in fileArray  {
        do {
            try fileMgr.removeItem(atPath: folderPath.stringByAppendingPathComponent(filename))
        } catch {
            print(" clean error ")
        }
        
    }
}

extension UIImage {
    class func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

extension UINavigationBar {
    
    func hideBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView?.isHidden = true
    }
    
    func showBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView?.isHidden = false
    }
    
    func changeBottomHairImage() {
    }
    
    fileprivate func hairlineImageViewInNavigationBar(_ view: UIView) -> UIImageView? {
        if let view = view as? UIImageView, view.bounds.height <= 1.0 {
            return view
        }
        
        for subview in view.subviews {
            if let imageView = hairlineImageViewInNavigationBar(subview) {
                return imageView
            }
        }
        
        return nil
    }
}


