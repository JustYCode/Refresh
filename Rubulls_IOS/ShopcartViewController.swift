//
//  ShopcartViewController.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/8.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class ShopcartViewController: BaseUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func backButton()->BackButtonStyle{
        return BackButtonStyle.none;
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
