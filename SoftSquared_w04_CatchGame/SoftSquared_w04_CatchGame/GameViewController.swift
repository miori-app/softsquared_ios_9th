//
//  GameViewController.swift
//  SoftSquared_w04_CatchGame
//
//  Created by miori Lee on 2020/08/14.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
      
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t1) in
                
                let randomNum = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100)))+1)
                
                var chickenbreast = UIImageView()
                chickenbreast.image = UIImage(named: "Grilled-Chicken-Breast")
                chickenbreast.frame = CGRect(x: randomNum + 30, y: 30, width: 30, height: 30)
                
                self.view.addSubview(chickenbreast)
                
            }
       
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
