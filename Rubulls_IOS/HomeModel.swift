//
//  HomeModel.swift
//  Rubulls_IOS
//
//  Created by 黄盟 on 2017/4/15.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit
import SwiftyJSON
class HomeModel: NSObject {

}
class TopicModel: NSObject {
    
    var header_pic = String()
    var link = String()
    var list:NSArray   = []

    init(dic: JSON) {
        self.header_pic = dic["header_pic"].stringValue
        self.list = dic["list"].array! as NSArray
        self.link = dic["link"].stringValue
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
class ImgModel: NSObject {
    var photo = String()
    
    init(dic: JSON) {
        self.photo = dic["pic_path"].stringValue
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
class HotModel: NSObject {
    
    var product_name = String()
    var master_pic = String()
    var sale_price = String()
    var link : String?
    init(dic: JSON) {
        self.product_name = dic["product_name"].stringValue
        self.master_pic = dic["master_pic"].stringValue
        self.sale_price = dic["sale_price"].stringValue
        self.link = dic["link"].stringValue
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
