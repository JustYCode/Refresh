//
//  LoginApi.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/8/31.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation

class RegisterApi:BaseApi {
    
  
    var cellPhone:String!
    var pwd:String!
    var authcode:String!
    
    init(_ cellPhone:String,pwd:String,authcode:String) {
        self.cellPhone = cellPhone
        self.pwd = pwd
        self.authcode = authcode
        super.init();
    }
    
    
    override func requestUrl() -> String {
        return OptConfig.ApiUrl.register;
    }
    
    
    override func requestArgument() -> Any? {
        return ["cellPhone":self.cellPhone,"pwd":self.pwd,"authcode":self.authcode]
    }
    
        
    
}
