//
//  DoodsCell.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/5/3.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class DoodsCell: UITableViewCell {
    var mainLabel = UILabel(frame: CGRect.init(x: 20, y: 10, width: SCREEN_WIDTH - 40, height: 20))
    var priceLabel = UILabel(frame: CGRect.init(x: 20, y: 30, width: 100, height: 10))
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
