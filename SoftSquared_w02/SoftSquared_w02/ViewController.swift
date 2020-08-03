//
//  ViewController.swift
//  SoftSquared_w02
//
//  Created by miori Lee on 2020/07/30.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var unameTextFiled: UITextField!
    @IBOutlet weak var saveLogTF: UITextField!
    
    @IBOutlet weak var userInfo: UILabel!
    var userID : String? 
    
    @IBOutlet weak var valuePass: UIButton!
    
    @IBAction func didTapAction(_ sender: Any) {
        let uname : String = unameTextFiled.text! //lazy가 뭐지? 왜 되지?r
        print("yout input : \(uname)")
        let secondViewController = self.storyboard?.instantiateViewController(identifier: "SecondViewCtrl") as! SecondViewController
        
        secondViewController.result = uname
        
        self.present(secondViewController, animated: true, completion: nil)
        unameTextFiled.text = ""
        
    }
    @IBAction func didTapSignIn(_ sender: Any) {
        let signInViewController = self.storyboard?.instantiateViewController(identifier: "LoginFormViewCtrl") as! LoginFormViewController
        
        self.present(signInViewController, animated: true, completion: nil)
    }
    
    func popUpAlert(){
        print("alert")
        if let c_userID = userID {
            print("벗겨지니? \(c_userID)") //성공
            //userInfo?.text = "환영합니다"
            var alert = UIAlertController(title: "LoginSuccess", message: "로그인성공", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK",  style: .default, handler: nil)
            alert.addAction(okBtn)
            present(alert, animated: true, completion: nil)
        } else {
            print("nil이니까 그대로")
            var alert = UIAlertController(title: "❗️SingIn Please", message: "로그인해주세요", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK",  style: .default, handler: nil)
            alert.addAction(okBtn)
            present(alert, animated: true, completion: nil)
            //userInfo?.text! = "로그인을 해주세요"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        unameTextFiled?.placeholder = "값넘기기"
        unameTextFiled.becomeFirstResponder() //focus
        print("first view  did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("1 : viewWillAppear")
        //print("좀 되라....\(userID)")
        
        //성공코드
        //        if let c_userID = userID {
        //            print("벗겨지니? \(c_userID)") //성공
        //            userInfo?.text = "환영합니다"
        //        } else {
        //            print("nil이니까 그대로")
        //            userInfo?.text! = "로그인을 해주세요"
        //        }
        
        //        if userID != nil {
        //            userInfo.text = "\(userID!)님"
        //        } else {
        //            userInfo.text = "로그인해주세요"
        //        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        popUpAlert()
        print("1 : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("1 : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        userInfo?.text = "로그인을 해주세요"
        print("1 : viewDidDisappear")
    }
    
    
}

