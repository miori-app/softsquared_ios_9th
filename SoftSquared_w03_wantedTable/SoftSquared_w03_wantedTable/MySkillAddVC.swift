//
//  MySkillAddVC.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/11.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit




class MySkillAddVC : UIViewController, AddSkill  {
    
    func AddMySkill() {
        let mylanInput = lanInput.text!
        let myinterInput = interInput.text!
        if mylanInput.count > 0 && myinterInput.count>0{
        prevViewController?.myLang.append(mylanInput)
        prevViewController?.myInterested.append(myinterInput)
        } else if mylanInput.count > 0 && myinterInput.count == 0 {
            prevViewController?.myLang.append(mylanInput)
        } else if mylanInput.count == 0 && myinterInput.count > 0 {
            prevViewController?.myInterested.append(myinterInput)
        } else {
            popUpAlert()
        }
        //prevViewController?.tableView.reloadData()
        //print(prevViewController?.myLang ?? "")
    }
    
    
    //이전 뷰를 정의 (둘이연결 1)
    var prevViewController : MySkillVC?
    
    @IBOutlet weak var lanInput: UITextField!
    @IBOutlet weak var interInput: UITextField!
    
    @IBAction func didTapSend(_ sender: Any) {
        AddMySkill()
        dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lanInput.placeholder = "language 입력"
        interInput.placeholder = "관심분야 입력"
        
        //상속한다음 이제 delegate가 나다!! 라는것을 정의 꼭 해야함
        prevViewController?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        lanInput.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        
        //내가 입력한 스킬이 스킬이보여지는 VC 에 반영해주는 코드 (핵심코드임!!)
        prevViewController?.tableView.reloadData()
    }
    
    func popUpAlert(){
        
        print("입력안함")
        let alert = UIAlertController(title: "❗️No Input", message: "둘 중 하나는 입력을 해주세여", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK",  style: .default, handler: nil)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
        //userInfo?.text! = "로그인을 해주세요"
    }
    
}

