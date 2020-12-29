//
//  RoleTableViewCell.swift
//  NestedMenu
//
//  Created by Shanu on 24/12/20.
//  Copyright © 2020 Shanu. All rights reserved.
//

import UIKit

class RoleTableViewCell: UITableViewCell {
    @IBOutlet weak var bgview: UIView!
     @IBOutlet weak var btnRole: UIButton!
     @IBOutlet weak var lblRole: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
