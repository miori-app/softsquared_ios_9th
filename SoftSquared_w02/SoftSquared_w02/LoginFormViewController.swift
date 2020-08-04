//
//  LoginFromViewController.swift
//  SoftSquared_w02
//
//  Created by miori Lee on 2020/07/31.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    var uid : String = ""
    
    @IBOutlet weak var uidInput: UITextField!
    @IBOutlet weak var upwInput: UITextField!
    
    @IBAction func didTapSignIn(_ sender: Any) {
        uid = uidInput.text!
        print("your ID : \(uid)")
    
//        let firstViewController = self.storyboard?.instantiateViewController(identifier: "FirstViewCtrl") as! ViewController
//
//        firstViewController.userID = uid
        
        if popUpAlert(dbID: "miori") == 1{
            dismiss(animated: true, completion: nil)
        } else {
            upwInput?.text = ""
            uidInput?.text = ""
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        designTextField(uidInput)
        designTextField(upwInput)
        
        print("login view  did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("LogIn : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        uidInput.becomeFirstResponder() //focus
        print("LogIn : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        if popUpAlert(dbID: "miori") == 1{
        vc.userInfo?.text = "\(uid)님 환영합니다~"
        //firstViewController.userInfo?.text = "환영합니다"
        self.presentingViewController?.dismiss(animated: true)
        //dismiss(animated: true, completion: nil)
        //firstViewController.userInfo.text! = "\(uid)님 환영합니다"
        //self.present(firstViewController, animated: true, completion: nil)
        } else {
        }
        
        print("LogIn : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("LogIn : viewDidDisappear")
    }
    
    func popUpAlert(dbID : String) -> Int {
        //print("alert")
        if dbID == uidInput.text {
            print("id 있음") //성공
            return 1
            //userInfo?.text = "환영합니다" 
            //var alert = UIAlertController(title: "LoginSuccess", message: "로그인성공", preferredStyle: .alert)
            //let okBtn = UIAlertAction(title: "OK",  style: .default, handler: nil)
            //alert.addAction(okBtn)
            //present(alert, animated: true, completion: nil)
        } else {
            print("id 없음")
            var alert = UIAlertController(title: "❗️회원가입 먼저", message: "등록된 ID가 없어요!!", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK",  style: .default, handler: nil)
            alert.addAction(okBtn)
            present(alert, animated: true, completion: nil)
            //userInfo?.text! = "로그인을 해주세요"
            return 0
        }
        
    }
    
    func designTextField(_ textField: UITextField) {
           textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.systemBlue.cgColor
           textField.layer.borderWidth = 1/UIScreen.main.scale
       }
    
    
    //    if let c_userID = userID {
    //             print("벗겨지니? \(c_userID)") //성공
    //             userInfo?.text = "환영합니다"
    //         } else {
    //             print("nil이니까 그대로")
    //             userInfo?.text! = "로그인을 해주세요"
    //         }
    
    
}
