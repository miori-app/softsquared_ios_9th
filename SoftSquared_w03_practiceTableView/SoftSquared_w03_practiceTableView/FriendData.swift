//
//  FriendData.swift
//  SoftSquared_w03_practiceTableView
//
//  Created by miori Lee on 2020/08/06.
//  Copyright © 2020 miori. All rights reserved.
//

import Foundation

class FriendData {
    var name : String?
    var profileMessage : String?
    
    //init 안에 _(언더바) 넣어주면 external name / external parameter 받지 않게 해줌
    //말인 즉슨 name:"miori" 이런식으로 받아올 필요 없음
    init(_ name : String, _ profileMessage : String) {
        self.name = name
        self.profileMessage = profileMessage
    }
}

