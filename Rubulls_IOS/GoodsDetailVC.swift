//
//  GoodsDetailVC.swift
//  Rubulls_IOS
//
//  Created by 小黄star on 2017/5/3.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit

class GoodsDetailVC: BaseUIViewController,UITableViewDelegate,UITableViewDataSource {
    fileprivate var headerSC = DoodsView(frame:CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*CGFloat(0.5)))
     fileprivate var footerV = DoodsFooter(frame:CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
    fileprivate var tableView = UITableView(frame:CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*CGFloat(2)),style:.grouped)
    var mainLabel = UILabel(frame: CGRect.init(x: 20, y: 10, width: SCREEN_WIDTH - 40, height: 20))
    var priceLabel = UILabel(frame: CGRect.init(x: 20, y: 40, width: 100, height: 10))
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    func setUpUI(){
        tableView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return SCREEN_HEIGHT
        }
        return 10
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            return headerSC
//        }
//        return nil
//    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 2 {
            return footerV
        }
        return nil
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 60
            }
        }
        return 40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid="cellid"
        var cell=tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil
        {
            cell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellid)
        }
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell?.contentView.addSubview(mainLabel)
                cell?.contentView.addSubview(priceLabel)
                mainLabel.text = "德玛西亚万岁"
                mainLabel.font = UIFont.systemFont(ofSize: 15)
                priceLabel.text = "¥2.80"
                priceLabel.font = UIFont.systemFont(ofSize: 13)
            }
            if indexPath.row == 1 {
                cell?.textLabel?.text = "剩余 : 10"
            }
        }
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell?.textLabel?.text = "选择 : 规格"
            }
        }
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell?.textLabel?.text = "儒牛网自营店"
            }
        }
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
