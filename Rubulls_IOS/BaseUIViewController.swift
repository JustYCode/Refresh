//
//  BaseUIViewController.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/4/13.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import UIKit
import IoniconsSwift
import URLNavigator

class BaseUIViewController: UIViewController {
    
    
    enum BackButtonStyle {
        case none
        case normal
        case close
       }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBaseBtn();
        
        //设置导航栏颜色
        self.navigationController?.navigationBar.barTintColor = OptConfig.baseColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.hideBottomHairline()
        
        //设置标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //设置状态蓝颜色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    
    func loadBaseBtn(){
        if(self.backButton()==BackButtonStyle.none){
            self.navigationItem.hidesBackButton = true;
        }else{
            let leftBtn:UIBarButtonItem = UIBarButtonItem();
            leftBtn.tintColor = UIColor.white;
            if(self.backButton()==BackButtonStyle.normal){
                leftBtn.image = Ionicons.chevronLeft.image(24,color: UIColor.white);
            }else if(self.backButton()==BackButtonStyle.close){
                leftBtn.image = Ionicons.close.image(24,color: UIColor.white);
            }
       
            leftBtn.target = self;
            leftBtn.action = #selector(BaseUIViewController.backClick);
            self.navigationItem.leftBarButtonItem = leftBtn;
        }
    }
    

    
    
    func backClick(){
        if(self.backButton()==BackButtonStyle.normal){
            self.navigationController?.popViewController(animated: true);
        }else if(self.backButton()==BackButtonStyle.close){
            self.parent?.dismiss(animated: true, completion: nil);
        }
    }
    

    
    func backButton()->BackButtonStyle{
        return BackButtonStyle.normal;
    }


    
    
}
