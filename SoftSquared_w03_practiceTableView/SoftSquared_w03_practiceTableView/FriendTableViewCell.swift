//
//  FriendTableViewCell.swift
//  SoftSquared_w03_practiceTableView
//
//  Created by miori Lee on 2020/08/06.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var uiName: UILabel!
    @IBOutlet weak var uiProfileMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
