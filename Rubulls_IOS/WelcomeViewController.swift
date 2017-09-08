//
//  WelcomeViewController.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/17.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = CircleProgressButton(frame: CGRect(x: UIScreen.main.bounds.width-55, y: 30, width: 30, height: 30))
        btn.lineWidth = 2;
        btn.setTitle("跳过", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.addTarget(self, action: #selector(WelcomeViewController.gotoMain), for: .touchUpInside)
        btn.startAnimationDuration(duration: 5) { 
           self.gotoMain()
        }
        
        self.view.addSubview(btn)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gotoMain(){
        UIApplication.shared.keyWindow?.rootViewController = MainTabBarViewController()
        self.dismiss(animated: true, completion: nil)
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
