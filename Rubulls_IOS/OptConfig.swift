//
//  Config.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/3/18.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import UIKit


class OptConfig {
    
    //静态常量
    static let baseUrl: String = "https://rubulls.nfc-hxd.com/"
    //static let baseUrl: String = "http://10.211.55.3:7006/"
    static let baseColor:UIColor = UIColor(red: 237/255, green: 80/255, blue: 80/255, alpha: 1.0);
    static let xgId: UInt32 = 2200242785
    static let xgKey: String = "I147X6ASDZ2C"
   
    //静态方法
    class func clientType() -> Int {
        // TODO: clientType
        
        #if DEBUG
            return 2
        #else
            return 0
        #endif
    }
    
    //结构体
    struct CacheData {
        static let user:String = "cache.data.user"
    }

    struct CacheUser {
        static let id:String      = "cache.user.id"
        static let token:String   = "cache.user.token"
        static let pwd:String   = "cache.user.pwd"
        static let account:String   = "cache.user.account"
        static let nickname:String   = "cache.user.nickname"
        static let goldmoney:String   = "cache.user.goldmoney"
    }

    struct ApiUrl {
        static let home:String   = "service/index/home"
        static let homeFooter:String   = "service/index/scroll"
        static let login:String   = "service/login/check"
        static let register:String   = "service/login/register"
        static let authcode:String   = "service/login/authCode"
     }
    
    struct Notification {
        static let sendSmsFinished:String   = "sendSmsFinished"
    }
       
}
