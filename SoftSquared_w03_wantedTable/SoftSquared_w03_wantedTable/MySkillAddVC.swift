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
        prevViewController?.myLang.append(mylanInput)
        prevViewController?.myInterested.append(myinterInput)
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
        
        prevViewController?.tableView.reloadData()
    }
}
