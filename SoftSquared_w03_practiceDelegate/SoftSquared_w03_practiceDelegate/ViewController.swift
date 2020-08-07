//
//  ViewController.swift
//  SoftSquared_w03_practiceDelegate
//
//  Created by miori Lee on 2020/08/05.
//  Copyright © 2020 miori. All rights reserved.
//


/*
 - view1,view2
 - view2에서 입력한 텍스트 필드값을 view1에 반영
 - 말인즉슨, view2가 이일을 대신 수행
 */
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
    
    //method 요구 (구현이 아님)
    func talk()
    
    //initalizer 요구
    init(topic: String, language: String)
}

//값전달 delegate 만들기
protocol LabelChangedDelegate {
    func onChange()
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
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

class ViewController: UIViewController {
    
    //사용자 정의 이니셜라이저를 호출해야만함
    var person : Person?
    
    //deleagte 만들어 (이걸 만들어야 넘겨주는 뷰에서 델리게이트를 받아올수 있음)
    var delegaete : LabelChangedDelegate?

    @IBOutlet weak var uiLabel: UILabel!
    @IBAction func didTap(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        //나를 넘김 (2. self정의로 이한몸 다바쳐서 간닷)
        secondViewController.prevViewController = self
        //이 한몸 다바쳐서 간거..
        self.present(secondViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //사용자 정의 이니셜라이저를 호출해야만함
        person = Person("miori")
        
        // !붙여서 Optional제거
        print((person?.name)!)
        person?.fly()
        person?.run()
        print("hello")
        
    }


}

