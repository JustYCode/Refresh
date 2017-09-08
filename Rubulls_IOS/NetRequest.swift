//
//  NetRequest.swift
//  Rubulls_IOS
//
//  Created by 黄盟 on 2017/4/15.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit
import Alamofire
let managers = Alamofire.NetworkReachabilityManager()
private let NetRequestShareInstance = NetRequest()
class NetRequest: NSObject {
    class var sharedInstance: NetRequest {
        return NetRequestShareInstance
    }
}
extension NetRequest{
    
//    func getRequest(urlString: String, params : [String : Any], finished : @escaping (_ response : [String : AnyObject]?,_ error: NSError?)->()) {
    func getRequest(urlString: String, finished : @escaping (_ response : [String : AnyObject]?,_ error: NSError?)->()) {
        managers?.startListening()
        let isReachables:Bool? = managers?.isReachable
        if(isReachables == true){
            Alamofire.request(urlString, method: .get).responseJSON { (response) in
            finished(response.result.value as? [String : AnyObject],nil)
            }
        }else{
            KeyWindow?.rootViewController?.showHintInKeywindow(hint: "网络中断了", duration: 3.0, yOffset: 0)
        }
        managers?.stopListening()
    }
    
    
    func postRequest(urlString: String, finished : @escaping (_ response : [String : AnyObject]?,_ error: NSError?)->()) {
        managers?.startListening()
        let isReachables:Bool? = managers?.isReachable
        if(isReachables == true){
            Alamofire.request(urlString, method: .post)
                .responseJSON { (response) in
            finished(response.result.value as? [String : AnyObject],nil)
            }
        }else{
            KeyWindow?.rootViewController?.showHintInKeywindow(hint: "网络中断了", duration: 3.0, yOffset: 0)
        }
        managers?.stopListening()
    }
}

