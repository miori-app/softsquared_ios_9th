//
//  GameViewController.swift
//  SoftSquared_w04_CatchGame
//
//  Created by miori Lee on 2020/08/14.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var liftingBear: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t1) in
            
            let randomNum = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100)))+1)
            
            var chickenbreast = UIImageView()
            //chickenbreast.image = UIImage(named: "Grilled-Chicken-Breast")
            //chickenbreast.frame = CGRect(x: randomNum + 30, y: 30, width: 40, height: 40)
            self.ChickenMoveX(chickenimage: chickenbreast, randomNum: randomNum)
            self.view.addSubview(chickenbreast)
            
            //chicken fall을 하고 싶어
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (t2) in
                //chickenbreast.center.y += 1
                self.ChickenFall(chickenimage: chickenbreast)
                
            }
            
        }
        //곰의 움직임 (제스처 받아서 움직여)
        DispatchQueue.global(qos: .userInteractive).async {
            self.liftingBear.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(GameViewController.BearMove(_:))))
        }
        
        
    }
    
    func ChickenMoveX(chickenimage : UIImageView, randomNum : Int) {
        
        chickenimage.image = UIImage(named: "Grilled-Chicken-Breast")
        chickenimage.frame = CGRect(x: randomNum + 30, y: 30, width: 40, height: 40)
    }
    
    func ChickenFall(chickenimage : UIImageView) {
        chickenimage.center.y += 1
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
