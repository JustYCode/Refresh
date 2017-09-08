//
//  DetailTopicVCViewController.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/4/19.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON
class DetailTopicVCViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var dataSources = Array<HotModel>()
    var mainCollection : UICollectionView?
    var taobaoHeader = TaoBaoRefreshHeader(frame: CGRect(x: 0,y: 0,width: SCREEN_WIDTH,height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        createView()
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func loadData(){
        NetRequest.sharedInstance.postRequest(urlString: "https://rubulls.nfc-hxd.com/service/index/home", finished: {(response,error) in
            
            let json = JSON(response!)
            for (_,subJson) : (String,JSON) in json["data"]["products"] {
                
                let model = HotModel.init(dic: subJson)
                self.dataSources.append(model)
            }
            self.mainCollection?.reloadData()
        })

    }
    func createView(){
        let layout = UICollectionViewFlowLayout();
        layout.headerReferenceSize=CGSize(width: SCREEN_WIDTH, height: 200);
        layout.sectionInset=UIEdgeInsetsMake(15, 5, 15, 5);
        layout.minimumInteritemSpacing=10;
        layout.minimumLineSpacing=10;
        mainCollection = UICollectionView(frame: CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:SCREEN_HEIGHT - 20), collectionViewLayout: layout);
        mainCollection!.backgroundColor=UIColor.white;
        view.addSubview(mainCollection!);
        mainCollection!.delegate=self;
        mainCollection!.dataSource=self;
        //注册cell
        mainCollection!.register(HomeCell.self, forCellWithReuseIdentifier: "cell");
        //注册sectionHeader
        mainCollection!.register(DetailHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        mainCollection?.backgroundColor = UIColor.init(colorLiteralRed: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1)
        _ = self.mainCollection?.setUpHeaderRefresh(taobaoHeader) { [weak self] in
            delay(1.5, closure: {
                self?.loadData()
                self?.mainCollection?.endHeaderRefreshing()
            })
        }
        mainCollection?.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction:  #selector(HomeViewController.footerRefresh))
        self.automaticallyAdjustsScrollViewInsets = false
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //每一个cell的大小
            let width=(SCREEN_WIDTH-20)/2;
            return CGSize(width: width, height: width*8/6);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(15, 5, 15, 5);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // 设置sectionHeader的size
        return  CGSize(width: SCREEN_WIDTH, height: 300);
      
    }
    
    //MARK:-sectionHeaderView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header:DetailHeader=collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! DetailHeader
        return header
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HomeCell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell;
            cell.backgroundColor = UIColor.white
            if self.dataSources.count > 0 {
                let model = dataSources[indexPath.item]
                cell.setDatas(model)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = GoodsDetailVC()
//            let model = self.dataSources[indexPath.item]
//            vc.num = model.link
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
    }

    //下拉刷新操作
    func headerRefresh(){
        self.dataSources.removeAll()
        self.mainCollection?.mj_header.endRefreshing()
    }
    //上拉加载操作
    func footerRefresh(){
        loadFooterData()
        self.mainCollection?.mj_footer.endRefreshing()
    }
    func loadFooterData(){
        NetRequest.sharedInstance.postRequest(urlString: "https://rubulls.nfc-hxd.com/service/index/scroll", finished: {(response,error) in
            let json = JSON(response!)
            for (_,subJson) : (String,JSON) in json["data"]["products"] {
                let model = HotModel.init(dic: subJson)
                self.dataSources.append(model)
            }
            self.mainCollection?.reloadData()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
