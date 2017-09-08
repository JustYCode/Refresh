//
//  CollectHeader.swift
//  Rubulls_IOS
//
//  Created by 黄盟 on 2017/4/14.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit

class CollectHeader: UICollectionReusableView {
    var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.frame = CGRect.init(x: SCREEN_WIDTH/2 - 50, y: 0, width: 100, height: 20)
        label.text = "最热商品推荐"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        addSubview(label)
        for i in 0 ..< 2{
            let lineView = UIView()
            lineView.backgroundColor = UIColor.lightGray
            lineView.frame = CGRect.init(x: 10 + CGFloat(i)*(label.right + 3), y: 10, width: SCREEN_WIDTH/3 - 10, height: 2)
            addSubview(lineView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
