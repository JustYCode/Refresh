//
//  HomeRefreshApi.swift
//  Rubulls_IOS
//
//  Created by MrChen on 2017/3/17.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class HomeRefreshApi: BaseApi {
    override init() {
        super.init();
    }
    
    override func requestUrl() -> String {
        return OptConfig.ApiUrl.homeFooter;
    }
}
