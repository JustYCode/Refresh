//
//  HomeViewController.swift
//  Rubulls_IOS
//
//  Created by 黄盟 on 2017/4/15.
//  Copyright © 2017年 黄盟. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON
class HomeViewController: BaseUIViewController,CycleImgDelegate,TopicDelegate,UISearchBarDelegate,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    let searchBar = UISearchBar(frame: CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0))
    var topicListView = TopicImgView()
    var cancleBtn = UIButton(frame: CGRect (x:SCREEN_WIDTH - 60,y:0.0,width:60.0, height:60.0))
    var textView = UIView(frame: CGRect (x:0.0,y:0.0,width:SCREEN_WIDTH, height:60.0))
    var mainCollection:UICollectionView?
    var array = Array<ImgModel>()
    var imgArr: HomeModel?
    var hotArr = Array<HotModel>()
    var topicArr = Array<TopicModel>()
    var taobaoHeader = TaoBaoRefreshHeader(frame: CGRect(x: 0,y: 0,width: SCREEN_WIDTH,height: 100))
    lazy var headerScrollView: CycleImg = {
        let headerScroll = CycleImg.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        return headerScroll
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        createView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createView() {
//        搜索框
        searchBar.backgroundColor = UIColor.white
        searchBar.delegate = self
        searchBar.placeholder = "搜索更赞的商品"
        searchBar.barStyle = UIBarStyle.default
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.returnKeyType = UIReturnKeyType.search
        textView.backgroundColor = UIColor.init(colorLiteralRed: 200/255.0, green: 201/255.0, blue: 206/255.0, alpha: 1)
        cancleBtn.setTitle("取消", for:.normal)
        cancleBtn.setTitleColor(UIColor.gray, for: .normal)
        cancleBtn.addTarget(self, action:#selector(HomeViewController.tapped), for:.touchUpInside)
        textView.addSubview(cancleBtn)
        textView.addSubview(searchBar)
        view.addSubview(textView)
        
        let layout = UICollectionViewFlowLayout();
        layout.headerReferenceSize=CGSize(width: SCREEN_WIDTH, height: 200);
        layout.sectionInset=UIEdgeInsetsMake(15, 5, 15, 5);
        layout.minimumInteritemSpacing=10;
        layout.minimumLineSpacing=10;
        mainCollection = UICollectionView(frame: CGRect(x: 0.0, y:60.0, width:SCREEN_WIDTH,height:SCREEN_HEIGHT - 173), collectionViewLayout: layout);
        mainCollection!.backgroundColor=UIColor.white;
        view.addSubview(mainCollection!);
        mainCollection!.delegate=self;
        mainCollection!.dataSource=self;
        headerScrollView.HeadDelegate = self
        topicListView.topicDelegate = self
        //注册cell
        mainCollection!.register(HomeCell.self, forCellWithReuseIdentifier: "cell");
        //注册sectionHeader
        mainCollection!.register(CollectHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        mainCollection!.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerID")
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
    //MARK: 轮播图点击事件
    func clickImg(_ click: CycleImg, buttonTag: Int) {
        self.searchBar.resignFirstResponder()
        self.searchBar.endEditing(true)
        self.searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0)
    }
    func clickTopicImg(_ click: TopicImgView, buttonTag: Int) {
        let web = DetailTopicVCViewController()
//        let model = topicArr[buttonTag - 1]
//        web.num = model.link
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(web, animated: true)
        self.hidesBottomBarWhenPushed = false
        self.searchBar.resignFirstResponder()
        self.searchBar.endEditing(true)
        self.searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0)
    }
    //上拉加载操作
    func footerRefresh(){
            loadFooterData()
            self.mainCollection?.mj_footer.endRefreshing()
    }
    //MARK:-cell的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //每一个cell的大小
        if(indexPath.section==0){
            return CGSize.zero;
        }
        if(indexPath.section==2){
            let width=(SCREEN_WIDTH-20)/2;
            return CGSize(width: width, height: width*8/6);
        }
        return CGSize.zero;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(section==0){
            collectionView.collectionViewLayout.invalidateLayout();
            return UIEdgeInsetsMake(0, 0, 0, 0);
        }
        if(section==2){
            return UIEdgeInsetsMake(15, 5, 15, 5);
        }
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    //MARK:-设置组头宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // 设置sectionHeader的size
        if(section==2){
            return  CGSize(width: SCREEN_WIDTH, height: 20);
        }
        if(section==0){
            return  CGSize(width: SCREEN_WIDTH, height: 200);
        }
        return CGSize(width: SCREEN_WIDTH, height: (300 + 10)*CGFloat(self.topicArr.count));
    }
    
    //MARK:-设置组头
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if(indexPath.section==0){
            let cycleImg=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerID", for: indexPath)
         cycleImg.addSubview(headerScrollView)
            return cycleImg;
        }
        if(indexPath.section==2){
            let header:CollectHeader=collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectHeader
            return header
        }
        
        
        let headerView=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerID", for: indexPath)
        topicListView.frame =  CGRect (x:0.0,y:0.0,width:SCREEN_WIDTH, height:300*CGFloat(self.topicArr.count))
        headerView.addSubview(topicListView)
        return headerView;
        
       
    }
    
    //MARK:-UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return 0;
        }
        if(section==2){
            return self.hotArr.count
        }else{
            return 0;
        }
    }
    //MARK: collectionview协议方法
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HomeCell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell;
        if(indexPath.section==2){
            cell.backgroundColor = UIColor.white
            if self.hotArr.count > 0 {
                let model = hotArr[indexPath.item]
                cell.setDatas(model)
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let vc = WebViewVC()
            let model = self.hotArr[indexPath.item]
            vc.num = model.link!
            self.searchBar.resignFirstResponder()
            self.searchBar.endEditing(true)
            self.searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0)
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            self.hidesBottomBarWhenPushed = false
        }
        searchBar.endEditing(true)
        searchBar.text = nil
    }
    func tapped(){
        self.searchBar.resignFirstResponder()
        self.searchBar.text = nil
        self.searchBar.endEditing(true)
        self.searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
        self.searchBar.text = nil
        self.searchBar.endEditing(true)
        self.searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0)
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        UIView.animate(withDuration: 1,
                                   delay: 0.1, options: UIViewAnimationOptions.curveEaseInOut, animations: {() -> Void in
                                 searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH - 60,height:60.0)
        }){(finished) -> Void in
            
        }
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let vc = WebViewVC()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
        self.searchBar.resignFirstResponder()
        self.searchBar.endEditing(true)
        self.searchBar.frame = CGRect(x: 0.0, y:0.0, width:SCREEN_WIDTH,height:60.0)
        searchBar.text = nil
    }
    
    //MARK: 数据请求
    func loadData()
    {
        self.hotArr.removeAll()
        self.array.removeAll()
        self.topicArr.removeAll()
        NetRequest.sharedInstance.postRequest(urlString: HomeUrl, finished: {(response,error) in
            print(response!)
            if (response != nil) {
                let json = JSON(response!)
                for (_,subJson) : (String,JSON) in json[Data][Ads] {
                    let model = ImgModel.init(dic: subJson)
                    self.array.append(model)
                }
                for (_,subJson) : (String,JSON) in json[Data][Pct] {
                    let model = HotModel.init(dic: subJson)
                    self.hotArr.append(model)
                }
                for (_,subJson) : (String,JSON) in json[Data][Tc] {
                    let model = TopicModel.init(dic: subJson)
                    self.topicArr.append(model)
                    self.topicListView.setDatas(model, topicArr: self.topicArr)
                }
                self.headerScrollView.getScrollImgsource(source: self.array)
                self.mainCollection?.reloadData()
            }
        })
    }
    //MARK:上拉加载
    func loadFooterData(){
        NetRequest.sharedInstance.postRequest(urlString: FooterRefresh, finished: {(response,error) in
            if (response != nil) {
                let json = JSON(response!)
                for (_,subJson) : (String,JSON) in json[Data][Pct] {
                    
                    let model = HotModel.init(dic: subJson)
                    self.hotArr.append(model)
                }
                self.mainCollection?.reloadData()
            }
        })
    }
    override func backButton()->BackButtonStyle{
        return BackButtonStyle.none;
    }
}

