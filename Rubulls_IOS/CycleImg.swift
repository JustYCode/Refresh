//
//  CycleImg.swift
//  Rubulls_IOS
//
//  Created by 黄盟 on 2017/4/15.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit

import SDCycleScrollView
protocol CycleImgDelegate {
    func clickImg(_ click:CycleImg,buttonTag: Int)
}
class CycleImg: UIView {
    var headerScroll = SDCycleScrollView()
    
    var HeadDelegate: CycleImgDelegate! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        headerScroll = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: 200), delegate: self, placeholderImage: UIImage.init(named: "PersonCenterbackImage"))
        headerScroll.autoScrollTimeInterval = 3.0
        self.addSubview(headerScroll)
    }
    
    func getScrollImgsource(source: Array<ImgModel>){
        var picArr = Array<String>()
        for model:ImgModel in source{
            picArr.append(model.photo)
        }
        headerScroll.imageURLStringsGroup = picArr
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CycleImg: SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        HeadDelegate.clickImg(self, buttonTag: index)
    }
}
