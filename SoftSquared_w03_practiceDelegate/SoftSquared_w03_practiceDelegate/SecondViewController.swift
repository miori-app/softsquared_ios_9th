//
//  SecondViewController.swift
//  SoftSquared_w03_practiceDelegate
//
//  Created by miori Lee on 2020/08/07.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

//LabelChangeDelegate를 상속하면서 이제 이기능을 내가함
//그다음. 원래 LabelChangeDelegate에 있었던 onChange를 내가 정의해야함
class SecondViewController : UIViewController, LabelChangedDelegate {
    func onChange() {
        prevViewController?.uiLabel.text = uiTextField.text
    }
    
    
    @IBOutlet weak var uiTextField: UITextField!
    @IBAction func didTap(_ sender: Any) {
        onChange()
        dismiss(animated: true, completion: nil)
    }
    
    //이전 뷰를 정의 (둘이연결 1)
    var prevViewController : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //상속한다음 이제 delegate가 나다!! 라는것을 정의 꼭 해야함
        prevViewController?.delegaete = self
    }
}
