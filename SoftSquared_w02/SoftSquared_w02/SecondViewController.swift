//
//  SecondViewController.swift
//  SoftSquared_w02
//
//  Created by miori Lee on 2020/07/30.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var unameLabel: UILabel!
    
    var result : String?
    
    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        unameLabel.text = result
        print("second view  did load")
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
