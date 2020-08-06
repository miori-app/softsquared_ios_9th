//
//  ViewController.swift
//  SoftSquared_w03_practiceTableView
//
//  Created by miori Lee on 2020/08/06.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet weak var uiFriendList: UITableView!
    
    var friendList : [FriendData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        friendList.append(FriendData("miori1", "hello1", false))
        friendList.append(FriendData("miori2", "hello2", false))
        friendList.append(FriendData("miori3", "hello3", false))
        friendList.append(FriendData("miori4", "hello4", false))
        friendList.append(FriendData("miori5", "hello5", false))
        friendList.append(FriendData("miori6", "hello6", false))
        friendList.append(FriendData("miori7", "hello7", false))
        friendList.append(FriendData("miori8", "hello8", false))
        friendList.append(FriendData("miori9", "hello9", false))
        friendList.append(FriendData("miori10", "hello10", false))
        friendList.append(FriendData("miori11", "hello11", false))
        friendList.append(FriendData("miori12", "hello12", false))
        friendList.append(FriendData("miori13", "hello13", false))
        friendList.append(FriendData("miori14", "hello14", false))
        friendList.append(FriendData("miori15", "hello15", false))
        friendList.append(FriendData("miori16", "hello16", false))
        friendList.append(FriendData("miori17", "hello17", false))
        friendList.append(FriendData("miori18", "hello18", false))
        friendList.append(FriendData("miori19", "hello19", false))
        friendList.append(FriendData("miori20", "hello20", false))
        friendList.append(FriendData("miori21", "hello21", false))
        friendList.append(FriendData("miori22", "hello22", false))
        // 내가 할꺼임 !!
        uiFriendList.delegate = self
        uiFriendList.dataSource = self
        
        //따로 만든 셀 쓸거라고 등록
        let frindCell = UINib(nibName: "FriendTableViewCell", bundle: nil)
        self.uiFriendList.register(frindCell, forCellReuseIdentifier: "FriendCell")
        
    } 
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else {
            
            return UITableViewCell()
        }
        
        
        let friendData : FriendData = friendList[indexPath.row]
        
        
        
        cell.uiName.text = friendData.name
        cell.uiProfileMessage.text = friendData.profileMessage
        cell.uiCheck.setOn(friendData.switchState!, animated: true)
        
        
        
        return cell
    }
    

    
    
}



