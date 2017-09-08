//
//  LoginViewController.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/8.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit
import URLNavigator
import Eureka

final class LoginViewController: BaseFormUIViewController{

    var userinfo:NSDictionary?
    
    init(_ userinfo:NSDictionary?) {
        self.userinfo = userinfo
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        loadForm()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func backButton()->BackButtonStyle{
        return BackButtonStyle.close;
    }
    
        
    
    func loadForm(){
        form +++ Section("")
            <<< TextRow("username"){
                $0.title = "账号 "
                $0.placeholder = "请输入手机号"
                }.cellUpdate({ (cell, row) in
                    cell.textField.textAlignment = .left
                    cell.textField.keyboardType = .numberPad
                })
            <<< PasswordRow("password"){
                $0.title = "密码 "
                $0.placeholder = "请输入密码"
                }.cellUpdate({ (cell, row) in
                    cell.textField.textAlignment = .left
                })
            +++ Section(){ section in
                section.header = {
                    var header = HeaderFooterView<UIView>(.callback({
                        let screenBounds:CGRect = UIScreen.main.bounds
                        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: 100))
                        
                        //登录按钮
                        let btn_login = UIButton(frame: CGRect(x: 20, y: 10, width: screenBounds.width-40, height: 40))
                        btn_login.layer.cornerRadius = 5
                        btn_login.layer.masksToBounds = true
                        btn_login.setTitle("登 录", for: .normal)
                        btn_login.setTitleColor(UIColor.white, for: .normal)
                        btn_login.setBackgroundImage(UIImage.imageWithColor(OptConfig.baseColor), for: .normal)
                        btn_login.addTarget(self, action: #selector(LoginViewController.login), for: .touchUpInside)
                        view.addSubview(btn_login);
                        
                        //注册按钮
                        let btn_register = UIButton(frame: CGRect(x: 20, y: 55, width: 100, height: 40))
                        btn_register.setTitle("手机号快速注册", for: .normal)
                        btn_register.setTitleColor(UIColor.gray, for: .normal)
                        btn_register.setTitleColor(OptConfig.baseColor, for: .highlighted)
                        btn_register.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                        btn_register.addTarget(self, action: #selector(LoginViewController.register), for: .touchUpInside)
                        view.addSubview(btn_register);
                        
                        //找回密码按钮
                        let btn_find = UIButton(frame: CGRect(x: screenBounds.width-90, y: 55, width: 80, height: 40))
                        btn_find.setTitle("找回密码", for: .normal)
                        btn_find.setTitleColor(UIColor.gray, for: .normal)
                        btn_find.setTitleColor(OptConfig.baseColor, for: .highlighted)
                        btn_find.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                        btn_find.addTarget(self, action: #selector(LoginViewController.findpwd), for: .touchUpInside)
                        view.addSubview(btn_find);

                        return view
                    }))
                    header.height = { 100 }
                    return header
                }()
                
        }
            
    }
    
    func login(){
        let row:TextRow! = form.rowBy(tag: "username")
        if(row.value == nil){
            OptHud.showError(withStatus: "请输入账号")
            return
        }
        
        let row2:PasswordRow! = form.rowBy(tag: "password")
        if(row2.value == nil){
            OptHud.showError(withStatus: "请输入密码")
            return
        }
        
       
        
        let api = LoginApi(row.value!, password: row2.value!)
        OptHud.show(withStatus: "正在登陆");
        api.startWithCompletionBlock(success: { (request) in
            OptHud.dismiss();
            
            
            self.dismiss(animated: true, completion: {
                if(self.userinfo != nil){
                    let url = URL(string: self.userinfo!.object(forKey: "redirect") as! String)
                    let type = self.userinfo!.object(forKey: "type") as! String
                    if(type == "tabbar"){
                        Navigator.open(url!)
                    }
                    
                }
            })
            
            
            
        }) { (request) in
            let result:NSDictionary = request.responseJSONObject as! NSDictionary;
            OptHud.showError(withStatus: result.object(forKey: "msg") as? String);
        }
        
        
    }
    
    func register(){
        let url = URL(string: "rubulls://register")
        Navigator.push(url!)
    }
    
    func findpwd(){
        print("findpwdddddd")
    }
}






// MARK: - URLNavigable

extension LoginViewController: URLNavigable {
    convenience init?(url: URLConvertible, values: [String: Any], userInfo: [AnyHashable: Any]?) {
        if(userInfo != nil){
            self.init(userInfo! as NSDictionary)
        }else{
            self.init(nil)
        }
        
        
    }
    
}
