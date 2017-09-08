//
//  PersonalTableViewCell.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/10.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit
import IoniconsSwift

class PersonalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btn_topay: UIButton!
    @IBOutlet weak var btn_totrans: UIButton!
    @IBOutlet weak var btn_toreceive: UIButton!
    @IBOutlet weak var btn_toservice: UIButton!
    
    typealias ClickCallBack = (Int)-> ()
    var myClick:ClickCallBack?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btn_topay.setImage(Ionicons.iosListOutline.image(26), for: .normal)
        btn_totrans.setImage(Ionicons.iosPaperplaneOutline.image(30), for: .normal)
        btn_toreceive.setImage(Ionicons.iosDownloadOutline.image(26), for: .normal)
        btn_toservice.setImage(Ionicons.iosLightbulbOutline.image(26), for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(click:@escaping ClickCallBack){
        self.myClick = click
    }
    
    
    @IBAction func toall(_ sender: Any) {
        if(self.myClick != nil){
            self.myClick!(0)
        }
    }
    
    @IBAction func topay(_ sender: Any) {
        if(self.myClick != nil){
            self.myClick!(1)
        }
    }
    
    
    @IBAction func totrans(_ sender: Any) {
        if(self.myClick != nil){
            self.myClick!(2)
        }
    }
    
    @IBAction func toreceive(_ sender: Any) {
        if(self.myClick != nil){
            self.myClick!(3)
        }
    }
    
    @IBAction func toservice(_ sender: Any) {
        if(self.myClick != nil){
            self.myClick!(4)
        }
    }
}
