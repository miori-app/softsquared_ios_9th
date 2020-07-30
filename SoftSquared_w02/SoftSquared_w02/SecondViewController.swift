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
    var checkValue : Int = 0
    @IBAction func didTapBack(_ sender: Any) {
        checkValue = 1
        dismiss(animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
        /*
         let firstViewController = self.storyboard?.instantiateViewController(identifier: "FirstViewCtrl") as! ViewController
         
         var sendValue : String? = firstViewController.unameTextFiled?.text
         if sendValue != nil{
         print("check1")
         sendValue?.removeAll()
         
         } else {
         sendValue?.removeAll()
         }
         
         self.dismiss(animated: true, completion: nil)
         */
        
        
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        checkValue = 0
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
        //self.present(firstViewController, animated: false, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("2 : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("save!")
        let firstViewController = self.storyboard?.instantiateViewController(identifier: "FirstViewCtrl") as! ViewController
        firstViewController.viewWillAppear(true)
        print("2 : viewWillDisappear")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print("2 : viewDidDisappear")
        
    }
  
}

