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
    @IBAction func didTapAction(_ sender: Any) {
        let uname : String = unameTextFiled.text!
        print(uname)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("first view  did load")
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

