//
//  HomeCell.swift
//  Rubulls_IOS
//
//  Created by 黄盟 on 2017/4/14.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    var img = UIImageView()
    var title = UILabel()
    var price = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width=(SCREEN_WIDTH-20)/2;
        img.frame = CGRect.init(x: 0, y: 0, width: width, height: width*8/6 - 60)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        title.frame = CGRect.init(x: 2, y: img.bottom, width: img.width - 4, height: 40)
        title.numberOfLines = 0
        title.textColor = UIColor.lightGray
        price.frame = CGRect.init(x: 2, y: title.bottom, width: img.width, height: 20)
        price.textColor = UIColor.init(colorLiteralRed: 254/255.0, green: 37/255.0, blue: 65/255.0, alpha: 1)
        title.font = UIFont.systemFont(ofSize: 13)
        price.font = UIFont.systemFont(ofSize: 13)
        addSubview(img)
        addSubview(title)
        addSubview(price)
    }
    
    func setDatas(_ model : HotModel) {
        let picture = model.master_pic
        let name = model.product_name
        title.text = name
        price.text = "￥" + model.sale_price
        let url = URL.init(string: picture)
        img.sd_setImage(with: url, placeholderImage: UIImage(named:""))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
