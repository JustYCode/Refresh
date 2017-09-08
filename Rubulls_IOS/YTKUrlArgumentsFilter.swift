//
//  YTKUrlArgumentsFilter.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/3/26.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation
import YTKNetwork

open class YTKUrlArgumentsFilter : NSObject ,YTKUrlFilterProtocol{
    
    var _arguments:NSDictionary?
    
    init(arguments:NSDictionary){
         _arguments = arguments;
    }
    
    
    open func filterUrl(_ originUrl: String, with request: YTKBaseRequest) -> String {
        
//        YTKUrlArgumentsFilter.url
//        
//        return YTKNetworkAgent
//        return YTKNetworkPrivate.urlString(withOriginUrlString: originUrl, appendParameters: _arguments as! [AnyHashable: Any])
        return ""
    }
    
    func urlParametersStringFromParameters(_ parameters:NSDictionary) ->String{
        let urlParametersString:NSMutableString = NSMutableString.init(string: "")
        if(parameters.count>0){
            for(key,value) in parameters.enumerated(){
                var strvalue:String = NSString(format: "%@", value as! CVarArg) as String
                strvalue = urlEncode(strvalue)
                urlParametersString.appendFormat("&%@=%@", key,strvalue)
            }
        }
        return urlParametersString as String
    }
    

    
//    + (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameters {
//    NSString *filteredUrl = originUrlString;
//    NSString *paraUrlString = [self urlParametersStringFromParameters:parameters];
//    if (paraUrlString && paraUrlString.length > 0) {
//    if ([originUrlString rangeOfString:@"?"].location != NSNotFound) {
//    filteredUrl = [filteredUrl stringByAppendingString:paraUrlString];
//    } else {
//    filteredUrl = [filteredUrl stringByAppendingFormat:@"?%@", [paraUrlString substringFromIndex:1]];
//    }
//    return filteredUrl;
//    } else {
//    return originUrlString;
//    }
//    }
    
    
    func urlEncode(_ str:String)->String{
        return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
   
    
}
