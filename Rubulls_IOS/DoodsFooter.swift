//
//  DoodsFooter.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/5/3.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class DoodsFooter: UIView {

    var imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        imageView.backgroundColor = UIColor.magenta
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
