//
//  NavigationMap.swift
//  URLNavigator
//
//  Created by Suyeol Jeon on 7/12/16.
//  Copyright © 2016 Suyeol Jeon. All rights reserved.
//

import UIKit
import URLNavigator

struct NavigationMap {

  static func initialize() {
    Navigator.map("rubulls://login", LoginViewController.self)
    Navigator.map("rubulls://register", RegisterViewController.self)
    Navigator.map("rubulls://tabbar/<int:sindex>") { url, values in
        let tabBarController = UIApplication.shared.keyWindow?.rootViewController as! UITabBarController
        let sindex = values["sindex"] as! Int
        tabBarController.selectedIndex = sindex
        
        return true
    }

  }

}
