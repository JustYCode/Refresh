//
//  TopicImgView.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/4/19.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit
import SwiftyJSON
protocol TopicDelegate {
    func clickTopicImg(_ click:TopicImgView,buttonTag: Int)
}
class TopicImgView: UIView,UIScrollViewDelegate {
    var topicListArr:[String]  = []
    var num: CGFloat?
    var topicDelegate:TopicDelegate! = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        num = 0
    }
    func setDatas(_ model : TopicModel , topicArr : Array<TopicModel> ){
        num = CGFloat(topicArr.count)
        self.topicListArr.removeAll()
        for i in 0 ..< model.list.count
        {
            let item0 = model.list[i]
            let popup: AnyObject = (item0 as AnyObject?)!
            let model = ImgModel.init(dic: popup as! JSON)
            self.topicListArr.append(model.photo)
        }
        let mainImgV = UIImageView()
        let button = UIButton()
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        button.frame = CGRect.init(x: 0, y: 300*(num! - 1), width: SCREEN_WIDTH, height: 200)
        mainImgV.frame = CGRect.init(x: 0, y: 300*(num! - 1), width: SCREEN_WIDTH, height: 200)
        mainImgV.contentMode = .scaleAspectFill
        mainImgV.clipsToBounds = true
        mainImgV.isUserInteractionEnabled = true
        button.tag = 1000 + Int(num!)
        button.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        let url = URL.init(string: model.header_pic)
        mainImgV.sd_setImage(with: url, placeholderImage: UIImage(named:""))
        addSubview(mainImgV)
        addSubview(button)
        scrollView.delegate = self
        scrollView.frame = CGRect.init(x: 0, y: 200 * num! + 100*(num! - 1), width: SCREEN_WIDTH, height: 100)
        scrollView.contentSize=CGSize(width:(SCREEN_WIDTH - 40)/3 * CGFloat(topicListArr.count) + 10*CGFloat(topicListArr.count + 1),height: 80)
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        scrollView.isScrollEnabled = true
        addSubview(scrollView)
        for i in 0 ..< self.topicListArr.count{
            let imageV = UIImageView()
            let button = UIButton()
            imageV.isUserInteractionEnabled = true
            button.frame = CGRect.init(x: 0, y:10, width: SCREEN_WIDTH , height: 100)
            button.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
            button.tag = Int(num!) + 1000
            imageV.frame = CGRect.init(x: 10 * CGFloat(i + 1) + ((SCREEN_WIDTH - 40)/3)*CGFloat(i), y:10, width: (SCREEN_WIDTH - 40)/3 , height: 80)
            imageV.contentMode = .scaleAspectFill
            imageV.clipsToBounds = true
            let url = URL.init(string: topicListArr[i])
            imageV.sd_setImage(with: url, placeholderImage: UIImage(named:""))
            imageV.addSubview(button)
            scrollView.addSubview(imageV)
        }
    }
    func tapped(_ button:UIButton){
        topicDelegate.clickTopicImg(self, buttonTag: button.tag - 1000)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
