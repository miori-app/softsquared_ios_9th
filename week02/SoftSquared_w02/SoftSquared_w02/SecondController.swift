//
//  SecondController.swift
//  SoftSquared_w02
//
//  Created by miori Lee on 2020/07/29.
//  Copyright © 2020 miori. All rights reserved.
//


import UIKit

class SecondController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var result :String? = "Defalt"
    
    @IBAction func didTapAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = result
        print("second view load")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("2 : viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("2 : viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("2 : viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("2 : viewDidDisappear")
    }



}

