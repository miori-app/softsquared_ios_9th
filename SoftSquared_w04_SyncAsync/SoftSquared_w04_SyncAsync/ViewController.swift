//
//  ViewController.swift
//  SoftSquared_w04_SyncAsync
//
//  Created by miori Lee on 2020/08/13.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    


        // 기본적으로 for문을 아래와 같이 짜면 다 증가하고 다시 감소하는 식으로 진행
        /*
             for i in 0 ..< 100 {
                 print(i)
                 usleep(1000)
             }

             for i in (0 ..< 100).reversed() {
                 print(i)
                 usleep(1000)
             }

         */

        // 그렇다면 동시에 하려면 어떻게 해?
        /*
            1. DispatchQueue를 도입하자
            2. qos : quality of service
                - background : 엄청나게 빠르게 동작할 필요가 없는 경우
                - userInteractive : 즉각적인 반응이 요구되는 작업
         */

        DispatchQueue.global(qos: .userInitiated).async {
            for i in 0 ..< 100 {
                print(i)
                usleep(1000)
            }
        }

        // context switching이 일어남
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            for i in (0 ..< 100).reversed() {
                print(i)
                usleep(1000)
            }
        }


    }


}

