//
//  DetailHeader.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/4/19.
//  Copyright © 2017年  黄盟. All rights reserved.
//

import UIKit

class DetailHeader: UICollectionReusableView {
    var imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 160))
    var label = UILabel(frame: CGRect.init(x: 10, y: 160, width: SCREEN_WIDTH - 20, height: 140))
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "屏幕快照 2017-04-19 上午9.43.27")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        label.textColor = UIColor.init(colorLiteralRed: 140/255.0, green: 140/255.0, blue: 140/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "包括 v 被河北 vvv 时间都被 v 看，v 肯定是被 v 和 u 规划 i 额外 v 决定把 v 是肯定会被 v 看科比 v 环保 v 时刻会被 v 了多少 v 和 v 乎日报波士顿和 v 背后都是 v，你是哦微 啊解放碑 v 动力和 v 被我看哭 v 的思念，。魁北克 v 必胜客的聚合,啦；啊；阿德玛西亚，看饿哦的 把 v 不到 v 白色短裤和 v 被上帝 v 比 v 丹江口市也会给人一天本菲卡家啊健康 v 把"
        label.numberOfLines = 0
        addSubview(imageView)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
