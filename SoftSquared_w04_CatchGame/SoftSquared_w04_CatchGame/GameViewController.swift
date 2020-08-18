//
//  GameViewController.swift
//  SoftSquared_w04_CatchGame
//
//  Created by miori Lee on 2020/08/14.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //@IBOutlet weak var liftingBear: UIImageView!
    var liftingBear = UIImageView()
    //@IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreProgress: UIProgressView!
    var currScore : Int = 0
    var levelCheck : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //곰움직임 수정을 위한 코드 수정
        liftingBear.image = UIImage(named: "liftingbear_cute")
        liftingBear.frame = CGRect(x: UIScreen.main.bounds.size.width/4, y: UIScreen.main.bounds.height - 250, width: 200, height: 250)
        liftingBear.isUserInteractionEnabled = true
        self.view.addSubview(liftingBear)
        
        //progress bar 높이 설정
        scoreProgress.transform = CGAffineTransform(scaleX: 1, y: 5)
        
        //progress bar border 둥글게
        scoreProgress.layer.cornerRadius = 8
        scoreProgress.clipsToBounds = true
        scoreProgress.layer.sublayers![1].cornerRadius = 8
        scoreProgress.subviews[1].clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        //progress bar  초기화
        scoreProgress.progress = 0.01
        
        //닭가슴살 fall
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t1) in
            
            let randomNum = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-110)))+1)
            //let randomNum2 = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100)))+1)
            
            let chickenbreast = UIImageView()
            //let pizza = UIImageView()
            chickenbreast.image = UIImage(named: "Grilled-Chicken-Breast")
            //pizza.image = UIImage(named: "pizza")
            chickenbreast.frame = CGRect(x: randomNum + 30, y: 30, width: 40, height: 40)
            //pizza.frame = CGRect(x: randomNum2 + 10, y: 30, width: 50, height: 50)
            self.ChickenMoveX(chickenimage: chickenbreast, randomNum: randomNum)
            //self.PizzaMoveX(pizzaimage: pizza, randomNum: randomNum2)
            self.view.addSubview(chickenbreast)
            //self.view.addSubview(pizza)
            
            //chicken fall을 하고 싶어
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (t2) in
                //chickenbreast.center.y += 1
                self.ChickenFall(chickenimage: chickenbreast)
                //self.ChickenFall(chickenimage: pizza)
                
                self.GameOver(chickenimage: chickenbreast, timer1: t1, timer2: t2)
                self.EatChicken(chickenimage: chickenbreast)
                
            }
            
        }
        
        //피자 fall
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (t3) in
            
            let randomNum = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-110)))+1)
            
            let pizza = UIImageView()
            pizza.image = UIImage(named: "pizza")
            pizza.frame = CGRect(x: randomNum + 30, y: 30, width: 50, height: 50)
            self.PizzaMoveX(pizzaimage: pizza, randomNum: randomNum)
            self.view.addSubview(pizza)
            
            //chicken fall을 하고 싶어
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (t4) in
                //chickenbreast.center.y += 1
                self.ChickenFall(chickenimage: pizza)
                //self.ChickenFall(chickenimage: pizza)
                self.GameOver(chickenimage: pizza, timer1: t3, timer2: t4)
                self.EatPizza(pizzaimage: pizza)
                
            }
            
        }
        
        //곰의 움직임 쓰레드로 보내줘!! (제스처 받아서 움직여)
        DispatchQueue.global(qos: .userInteractive).async {
            self.liftingBear.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(GameViewController.BearMove(_:))))
        }
        
        
    }
    
    func ChickenMoveX(chickenimage : UIImageView, randomNum : Int) {
        chickenimage.image = UIImage(named: "Grilled-Chicken-Breast")
        chickenimage.frame = CGRect(x: randomNum - 30, y: 30, width: 40, height: 40)
    }
    
    func PizzaMoveX(pizzaimage : UIImageView, randomNum : Int) {
        pizzaimage.image = UIImage(named: "pizza")
        pizzaimage.frame = CGRect(x: randomNum + 30, y: 30, width: 40, height: 40)
    }
    
    func ChickenFall(chickenimage : UIImageView) {
        chickenimage.center.y += 1
        //testCheck.text = "\(scoreProgress.progress)" //확인용
        
    }
    
    func GameOver(chickenimage : UIImageView, timer1 : Timer, timer2 : Timer) {
        //치킨이미지가 땅에 닿으면 게임오버 (==못먹으면)
        if chickenimage.image == UIImage(named: "Grilled-Chicken-Breast") {
            if (chickenimage.center.y > self.liftingBear.center.y + self.liftingBear.center.y/5 || scoreProgress.progress == 0.0) {
                timer1.invalidate()
                timer2.invalidate()
            
            
                            let alert = UIAlertController(title: "Game Over", message: "try again?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
            
                                //let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
                                //self.present(home, animated: true, completion: nil)
                                self.dismiss(animated: true, completion: nil)
                            }))
            
                            self.present(alert, animated: true, completion: nil)
            
                        }
        } else {
            if (scoreProgress.progress == 0.0) {
                timer1.invalidate()
                timer2.invalidate()
                
                let alert = UIAlertController(title: "Game Over", message: "try again?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                    
                    //let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    
                    //self.present(home, animated: true, completion: nil)
                    self.dismiss(animated: true, completion: nil)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }}
        
    }
    
    func EatChicken(chickenimage : UIImageView) {
        let halfWidthLB = self.liftingBear.bounds.size.width/2
        let halfHeightLB = self.liftingBear.bounds.size.height/2
        let halfWidthChicken = chickenimage.bounds.size.width/2
        if (chickenimage.center.x - halfWidthChicken > self.liftingBear.center.x - halfWidthLB && chickenimage.center.x + halfWidthChicken < self.liftingBear.center.x + halfWidthLB && chickenimage.center.y > self.liftingBear.center.y - halfHeightLB) {
            
            self.scoreProgress.progress += 0.1
            //self.currScore += 1
            //self.scoreLabel.text = "\(self.currScore)"
            
            //진화(level up)
            if self.scoreProgress.progress >= 1.0 {
                levelCheck = 1
                self.liftingBear.image = UIImage(named: "weightlifting")
                
                
                //레벨업 알려주기
                let alert = UIAlertController(title: "Level Up", message: "🎉축하축하🎉", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "계속하기", style: .default, handler: {(action) in
                    self.scoreProgress.progress = 0.01
                                    
                }))
                
                self.present(alert, animated: true, completion: nil)
                //self.scoreProgress.progress = 0.0
                
                
            }
            
            chickenimage.center.y = -1000000
            
        }
    }
    
    func EatPizza(pizzaimage : UIImageView) {
        let halfWidthLB = self.liftingBear.bounds.size.width/2
        let halfHeightLB = self.liftingBear.bounds.size.height/2
        let halfWidthPizza = pizzaimage.bounds.size.width/2
        if (pizzaimage.center.x - halfWidthPizza > self.liftingBear.center.x - halfWidthLB && pizzaimage.center.x + halfWidthPizza < self.liftingBear.center.x + halfWidthLB && pizzaimage.center.y > self.liftingBear.center.y - halfHeightLB) {
            
            self.scoreProgress.progress -= 0.1
            //self.currScore += 1
            //self.scoreLabel.text = "\(self.currScore)"
            
            pizzaimage.center.y = -1000000
            
        }
    }
    
    
    /* CGPoint
     - CGPoint 는 이차원 좌표계의 점을 정의하는 구조체
     */
    
    /* UIPanGestureRecognizer
     
     1. 먼저 translation메소드를 통해 이 Pan Gesture로 인해 변환되는 좌표 값을 얻어와야합니다.
     2. 그리고 우리의 이미지View에 이 translation을 적용해줘야합니다.
     
     - PanGesture : 패닝(드래그)하는 Gesture를 찾으며, UIgestureRecognizer의 구체적 하위클래스
     출처: https://zeddios.tistory.com/356 [ZeddiOS]
     - translation : translation의 설명을 하자면, 명시된 View(즉, 파라미터로 받은 view)의 좌표 시스템에서의 pan gesture의 변환(translation)입니다.
     출처: https://zeddios.tistory.com/356 [ZeddiOS]
     
     */
    
    @objc func BearMove(_ recognizer : UIPanGestureRecognizer) {
        let translation : CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x , y: recognizer.view!.center.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
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
