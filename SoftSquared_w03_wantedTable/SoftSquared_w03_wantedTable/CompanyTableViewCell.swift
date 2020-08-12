//
//  CompanyTableViewCell.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/08.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class CompanyTableViewCell : UITableViewCell {

    @IBOutlet weak var cLogoImg: UIImageView!
    @IBOutlet weak var cName: UILabel!
    @IBOutlet weak var cKind: UILabel!
    @IBOutlet weak var cFollow: UIButton!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //print("prepare for reuse")
        
        cFollow.setTitle("팔로우", for: .normal)
        cFollow.backgroundColor = UIColor.systemBlue
        cFollow.setTitleColor(UIColor.white, for: .normal)
        cFollow.layer.borderColor = UIColor.systemBlue.cgColor
        cFollow.layer.borderWidth = 1.0
    }
}
