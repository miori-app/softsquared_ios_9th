//
//  LoginFromViewController.swift
//  SoftSquared_w02
//
//  Created by miori Lee on 2020/07/31.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    @IBOutlet weak var uidInput: UITextField!
    @IBOutlet weak var upwInput: UITextField!
    
    @IBAction func didTapSignIn(_ sender: Any) {
        let uid : String = uidInput.text!
        print("your ID : \(uid)")
        let firstViewController = self.storyboard?.instantiateViewController(identifier: "FirstViewCtrl") as! ViewController
        
        firstViewController.userID = uid
        
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        vc.userInfo?.text = "\(uid)님 환영합니다~"
        //firstViewController.userInfo?.text = "환영합니다"
        self.presentingViewController?.dismiss(animated: true)
         //dismiss(animated: true, completion: nil)
        //firstViewController.userInfo.text! = "\(uid)님 환영합니다"
        //self.present(firstViewController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("login view  did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("LogIn : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("LogIn : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("LogIn : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let firstViewController = self.storyboard?.instantiateViewController(identifier: "FirstViewCtrl") as! ViewController
           
           firstViewController.userInfo?.text = "환영합니다"
        print("LogIn : viewDidDisappear")
    }
    
 
    
//    if let c_userID = userID {
//             print("벗겨지니? \(c_userID)") //성공
//             userInfo?.text = "환영합니다"
//         } else {
//             print("nil이니까 그대로")
//             userInfo?.text! = "로그인을 해주세요"
//         }
    
    
}
