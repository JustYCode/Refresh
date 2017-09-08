//
//  File.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/4/18.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import Foundation
import SVProgressHUD
let KeyWindow = UIApplication.shared.keyWindow
//首页接口
let HomeUrl = "https://rubulls.nfc-hxd.com/service/index/home"
let FooterRefresh = "https://rubulls.nfc-hxd.com/service/index/scroll"
//首页接口参数
let Data = "data"
let Ads = "ads"
let Pct = "products"
let Tc = "topic"

private var HUDKey = "HUDKey"
extension UIViewController
{
    
    var hud : SVProgressHUD?
    {
        get{
            return objc_getAssociatedObject(self, &HUDKey) as? SVProgressHUD
        }
        set{
            objc_setAssociatedObject(self, &HUDKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func showHintInKeywindow(hint: String, duration: Double = 2.0, yOffset:CGFloat? = 0) {
        SVProgressHUD.show(withStatus: hint)
        SVProgressHUD.dismiss(withDelay: duration)
    }
}
