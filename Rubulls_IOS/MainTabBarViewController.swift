//
//  MainTabBarViewController.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/15.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit
import IoniconsSwift
import URLNavigator

final class MainTabBarViewController: UITabBarController,UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadData(){
        let home = HomeViewController()
        let category = CategoryViewController()
        let shop = ShopcartViewController()
        let person = PersonalViewController()
        self.addChildViewController(BaseUINavigationController(rootViewController: home))
        self.addChildViewController(BaseUINavigationController(rootViewController: category))
        self.addChildViewController(BaseUINavigationController(rootViewController: shop))
        self.addChildViewController(BaseUINavigationController(rootViewController: person))
        
        let item0:UITabBarItem = self.viewControllers![0].tabBarItem;
        home.title = "首页";
        item0.image = Ionicons.iosHomeOutline.image(26);
        item0.selectedImage = Ionicons.iosHome.image(26);
        
        
        let item1:UITabBarItem = self.viewControllers![1].tabBarItem;
        category.title = "分类";
        item1.image = Ionicons.iosKeypadOutline.image(26);
        item1.selectedImage = Ionicons.iosKeypad.image(26);
        
        let item2:UITabBarItem = self.viewControllers![2].tabBarItem;
        shop.title = "购物车";
        item2.image = Ionicons.iosCartOutline.image(26);
        item2.selectedImage = Ionicons.iosCart.image(26);
        
        let item3:UITabBarItem = self.viewControllers![3].tabBarItem;
        person.title = "我";
        item3.image = Ionicons.iosPersonOutline.image(27);
        item3.selectedImage = Ionicons.iosPerson.image(27);
        
        self.tabBar.tintColor = OptConfig.baseColor
        
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if(viewController.tabBarItem.title == "购物车" ){
            if((OptStore.shared().object(forKey: OptConfig.CacheUser.id)) != nil){
                return true
            }else{
                let url = URL(string: "rubulls://login/")
                Navigator.present(url!, userInfo: ["redirect":"rubulls://tabbar/2","type":"tabbar"], wrap: true)

                return false
            }
        }else if(viewController.tabBarItem.title == "我" ){
            if((OptStore.shared().object(forKey: OptConfig.CacheUser.id)) != nil){
                return true
            }else{
                let url = URL(string: "rubulls://login/")
                Navigator.present(url!, userInfo: ["redirect":"rubulls://tabbar/3","type":"tabbar"], wrap: true)
                
                return false
            }
        }
        
        return true
    }


}



