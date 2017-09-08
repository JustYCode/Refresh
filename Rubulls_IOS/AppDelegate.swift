//
//  AppDelegate.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/7.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit
import YTKNetwork
import URLNavigator
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { return false }
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        window.rootViewController = WelcomeViewController()
        
        //初始化网络接口
        initYTK()
        
        //初始化路由接口/////
        NavigationMap.initialize()
        
        if let URL = launchOptions?[.url] as? URL {
            Navigator.present(URL)
        }

        return true
    }
    
    func initYTK(){
        let config:YTKNetworkConfig = YTKNetworkConfig.shared()
        config.baseUrl = OptConfig.baseUrl
        
//        let info:NSDictionary = Bundle.main.infoDictionary! as NSDictionary;
//        let version:AnyObject = info["CFBundleShortVersionString"]! as AnyObject
//        
//        let urlFilter: YTKUrlArgumentsFilter = YTKUrlArgumentsFilter.init(arguments: ["version":version,"os":"iOS"]);
//        config.addUrlFilter(urlFilter);


    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        // Try open URL first
        if Navigator.open(url) {
            NSLog("Navigator: Open \(url)")
            return true
        }
        
        // Try present URL
        if Navigator.present(url, wrap: true) != nil {
            NSLog("Navigator: Present \(url)")
            return true
        }
        
        return false
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

