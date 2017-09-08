//
//  BaseApi.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/3/18.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation
import YTKNetwork


open class BaseApi: YTKRequest {

    open func responseMsg()->String{
        
         let rep:AnyObject = self.responseJSONObject as AnyObject;
          var msg = rep["msg"];
         if(msg==nil){
            msg = "服务器连接失败";
        }else{
            if((msg as! String) == ""){
                msg = "无返回信息";
            }
           
        }
       
        return (msg as! String);
        
    }
    
    override  open func cacheTimeInSeconds() -> Int {
        return -1;
    }
    
    override open func requestMethod() -> YTKRequestMethod {
        return YTKRequestMethod.POST;
    }
    
   
    
}
