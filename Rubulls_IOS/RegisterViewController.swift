//
//  RegisterViewController.swift
//  Rubulls_IOS
//
//  Created by 吴银春 on 2017/3/8.
//  Copyright © 2017年 吴银春. All rights reserved.
//

import UIKit
import Eureka
import URLNavigator

final class RegisterViewController: BaseFormUIViewController {

    var remainingSeconds = 0 {
        willSet{
            let row: ButtonRow! = form.rowBy(tag: "getcode")
            row.title = "验证码已发送(\(newValue)秒后重新获取)"
            row.reload()

            if newValue <= 0{
                row.title = "重新获取验证码"
                row.reload()
                
                isCounting = false
            }
        }
    }
    var countdownTimer:Timer?
    var isCounting = false {
        willSet{
            if newValue{
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RegisterViewController.updateTime), userInfo: nil, repeats: true)
                remainingSeconds = 10
                let row: ButtonRow! = form.rowBy(tag: "getcode")
                row.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = UIColor.lightGray
                })
                row.disabled = true
                row.evaluateDisabled()
                row.reload()
                
            }else{
                countdownTimer?.invalidate()
                countdownTimer = nil
                
                let row: ButtonRow! = form.rowBy(tag: "getcode")
                row.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = OptConfig.baseColor
                })
                row.disabled = false
                row.evaluateDisabled()
                row.reload()
            }
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册"
        
        loadForm()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func loadForm(){
        form +++ Section("")
            <<< TextRow("phone"){
                $0.title = "手机号码 "
                $0.placeholder = "请输入手机号"
                }.cellUpdate({ (cell, row) in
                    cell.textField.textAlignment = .left
                    cell.textField.keyboardType = .numberPad
                })
            <<< PasswordRow("password"){
                $0.title = "设置密码 "
                $0.placeholder = "请输入密码"
                }.cellUpdate({ (cell, row) in
                    cell.textField.textAlignment = .left
                })
            
            +++ Section("")
            <<< TextRow("code"){
                $0.title = "验证码 "
                $0.placeholder = "请输入验证码"
                }.cellUpdate({ (cell, row) in
                    cell.textField.textAlignment = .left
                    cell.textField.keyboardType = .numberPad
                })
            <<< ButtonRow("getcode"){
                $0.title = "点击获取验证码"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = OptConfig.baseColor
                }).onCellSelection({ (cell, row) in
                    if (row.isDisabled == false){
                        self.getcode()
                    }
                })
            
            +++ Section(){ section in
                section.header = {
                    var header = HeaderFooterView<UIView>(.callback({
                        let screenBounds:CGRect = UIScreen.main.bounds
                        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: 60))
                        
                        //注册按钮
                        let btn_register = UIButton(frame: CGRect(x: 20, y: 10, width: screenBounds.width-40, height: 40))
                        btn_register.layer.cornerRadius = 5
                        btn_register.layer.masksToBounds = true
                        btn_register.setTitle("注 册", for: .normal)
                        btn_register.setTitleColor(UIColor.white, for: .normal)
                        btn_register.setBackgroundImage(UIImage.imageWithColor(OptConfig.baseColor), for: .normal)
                        btn_register.addTarget(self, action: #selector(RegisterViewController.register), for: .touchUpInside)
                        view.addSubview(btn_register);
                        
                        
                        return view
                    }))
                    header.height = { 60 }
                    return header
                }()
                
        }
        
    }
    
    func register(){
        let phone:TextRow! = form.rowBy(tag: "phone")
        if(phone.value == nil){
            OptHud.showError(withStatus: "请输入手机号")
            return
        }
        
        let pwd:PasswordRow! = form.rowBy(tag: "password")
        if(pwd.value == nil){
            OptHud.showError(withStatus: "请输入密码")
            return
        }
        
        let code:TextRow! = form.rowBy(tag: "code")
        if(code.value == nil){
            OptHud.showError(withStatus: "请输入验证码")
            return
        }
        
        let api = RegisterApi(phone.value!, pwd: pwd.value!, authcode: code.value!)
        OptHud.show(withStatus: "正在注册")
        api.startWithCompletionBlock(success: { (request) in
            OptHud.showSuccess(withStatus: "注册成功")
            _ = self.navigationController?.popViewController(animated: true)
            
            
        }) { (request) in
            let result:NSDictionary = request.responseJSONObject as! NSDictionary;
            OptHud.showError(withStatus: result.object(forKey: "msg") as? String);
        }
        
        
    }
    
    func updateTime() {
        remainingSeconds -= 1
    }
    
    func getcode(){
        let row:TextRow! = form.rowBy(tag: "phone")
        if(row.value == nil){
            OptHud.showError(withStatus: "请输入手机号")
            return
        }        
        
        isCounting = true
        
        let api = AuthCodeApi(row.value!)
        api.startWithCompletionBlock(success: { (request) in
            
        }) { (request) in
            let result:NSDictionary = request.responseJSONObject as! NSDictionary;
            OptHud.showError(withStatus: result.object(forKey: "msg") as? String);
        }
    }

}




// MARK: - URLNavigable

extension RegisterViewController: URLNavigable {
    convenience init?(url: URLConvertible, values: [String: Any], userInfo: [AnyHashable: Any]?) {
        self.init()
    }
    
}






