//
//  BaseUINavigationController.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/4/6.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import UIKit

class BaseUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏颜色
        self.navigationBar.barTintColor = OptConfig.baseColor
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.isTranslucent = false
        self.navigationBar.hideBottomHairline()
        
        //设置标题颜色
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //设置状态蓝颜色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
