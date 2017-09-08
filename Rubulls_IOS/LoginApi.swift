//
//  LoginApi.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/8/31.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation

class LoginApi:BaseApi {
    
  
    var username:String!
    var password:String!
    
    
    init(_ username:String,password:String){
        self.username = username
        self.password = password
        super.init()
    }
    
    
    override func requestUrl() -> String {
        return OptConfig.ApiUrl.login;
    }
    
    
    override func requestArgument() -> Any? {
        return ["username":self.username,"password":self.password]
    }
    
    override func requestCompleteFilter() {
        
        let result:NSDictionary = responseJSONObject as! NSDictionary;
        let data:NSDictionary = result.object(forKey: "data") as! NSDictionary;
        let user:NSDictionary = data.object(forKey: "info") as!NSDictionary;
        
        //缓存数据
        OptStore.shared().setObject(user, forKey: OptConfig.CacheData.user);
        OptStore.shared().setObject(user.object(forKey: "id") as? NSString, forKey: OptConfig.CacheUser.id);
        OptStore.shared().setObject(data.object(forKey: "token")as? NSString, forKey:OptConfig.CacheUser.token);
        OptStore.shared().setObject(self.password as NSCoding!, forKey: OptConfig.CacheUser.pwd);
        OptStore.shared().setObject(user.object(forKey: "account") as? NSString, forKey: OptConfig.CacheUser.account);
        OptStore.shared().setObject(user.object(forKey: "nickname") as? NSString, forKey: OptConfig.CacheUser.nickname);
        OptStore.shared().setObject(user.object(forKey: "gold_money") as? NSString, forKey: OptConfig.CacheUser.goldmoney);
        

    }
    
    
}
