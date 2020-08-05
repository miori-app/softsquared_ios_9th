//
//  ViewController.swift
//  SoftSquared_w03_practiceDelegate
//
//  Created by miori Lee on 2020/08/05.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

protocol Flyable : class {
    func fly()
    }

protocol Runnable : class {
    func run()
}

extension Flyable {
    func fly(){
        print("날았다")
    }
}

extension Runnable {
    func run(){
        print("달린다")
    }
}

class Person : Flyable, Runnable {
    var name : String?
    
    init(_ n: String) {
        self.name = n
    }
}

class ViewController: UIViewController {
    
    var person : Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        person = Person("miori")
        
        // !붙여서 Optional제거
        print((person?.name)!)
        person?.fly()
        person?.run()
        print("hello")
    }


}

