//
//  DoodsView.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/5/3.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class DoodsView: UIView {
    var imageView = UIImageView()
    var scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.5)
        imageView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.5)
        imageView.backgroundColor = UIColor.lightGray
        scrollView.addSubview(imageView)
        addSubview(scrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
