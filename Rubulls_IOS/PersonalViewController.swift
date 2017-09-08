//
//  PersonalViewController.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/8.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit
import URLNavigator
import Kingfisher
import IoniconsSwift

class PersonalViewController: BaseUIViewController ,UITableViewDataSource,UITableViewDelegate{

    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.register(UINib(nibName: "PersonalTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalTableViewCell")
        
        let screenBounds:CGRect = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.width*0.53))
        let backView = UIView(frame: CGRect(x: 5, y: 15, width: screenBounds.width-10, height: screenBounds.width*0.53-30))
        backView.backgroundColor = OptConfig.baseColor
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        view.addSubview(backView)
        
        let img = UIImageView(frame: CGRect(x: (screenBounds.width-10-screenBounds.width*0.21)/2, y: 20, width: screenBounds.width*0.21, height: screenBounds.width*0.21))
        let url = URL(string: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2370680417,2100809530&fm=116&gp=0.jpg")
        img.setImageWith(url!)
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.cornerRadius = screenBounds.width*0.21*0.5
        img.layer.masksToBounds = true
        backView.addSubview(img)
        
        let name = UITextView(frame: CGRect(x: 0, y: screenBounds.width*0.27, width: screenBounds.width-10, height: 40))
        name.text = "wycdavid"
        name.textColor = UIColor.white
        name.backgroundColor = UIColor.clear
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 14)
        backView.addSubview(name)
        
        tableView.tableHeaderView = view
        
        self.view.addSubview(tableView)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func backButton()->BackButtonStyle{
        return BackButtonStyle.none;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 3;
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(section==0){
            return 1;
        } else if(section==1){
            return 2;
        }else{
            return 2;
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 15
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if(indexPath.section == 0){
            let cell:PersonalTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "PersonalTableViewCell") as! PersonalTableViewCell;
            cell.selectionStyle =  UITableViewCellSelectionStyle.none;
            cell.loadData(click: { (type) in
                print(type)
            })

            return cell
            
        }else{
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "defaultcell")
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14);
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.separatorInset = UIEdgeInsets.zero
            if(indexPath.section == 1){
                if(indexPath.row==0){
                    cell.textLabel?.text = "我的优惠券"
                    cell.imageView?.image = Ionicons.iosPricetagsOutline.image(22);
                }else{
                    cell.textLabel?.text = "我的余额"
                    cell.imageView?.image = Ionicons.socialUsdOutline.image(23);
                }
            }else{
                if(indexPath.row==0){
                    cell.textLabel?.text = "收货地址管理"
                    cell.imageView?.image = Ionicons.iosLocationOutline.image(26);
                }else{
                    cell.textLabel?.text = "退出账号"
                    cell.imageView?.image = Ionicons.iosPersonOutline.image(26);
                }
            }
            
            return cell;
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if(indexPath.section==0){
            return 115
        }
        return 44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
   
}
