//
//  ViewController.swift
//  SoftSquared_w02
//
//  Created by miori Lee on 2020/07/29.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoInput: UITextField!
    @IBAction func didTapAction(_ sender: Any) {
        let data : String = infoInput.text!;
        //옵셔널
        print(data)
        
        let secondViewControl = self.storyboard?.instantiateViewController(withIdentifier: "SecondController") as! SecondController
        
        secondViewControl.result = data
        
        self.present(secondViewControl, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("first view load")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("1 : viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("1 : viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("1 : viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("1 : viewDidDisappear")
    }


}

