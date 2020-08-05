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

//yagom
protocol Talkable {
    //property
    /*
     - property 요구는 항상 var
     - get : only read
     - get set : read and write
     */
    var topic : String { get set }
    var language : String { get }
    
    //method
    func talk()
    
    //initalizer
    init(topic: String, language: String)
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

//Person 구조체는 Talkable 프로토콜을 Adpot(채택)
struct Person2 : Talkable {
    var topic: String
    
    var language: String
    
    func talk() {
        <#code#>
    }
    
    init(topic: String, language: String) {
        <#code#>
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

