//
//  LoginApi.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/8/31.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation

class HomeApi:BaseApi {
    
    
    override init() {
        super.init();
    }

    override func requestUrl() -> String {
        return OptConfig.ApiUrl.home;
    }
    
    
    
    
}
