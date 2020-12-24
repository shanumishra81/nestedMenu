//
//  MusicTableViewCell.swift
//  Music Player
//
//  Created by Shanu on 23/12/20.
//  Copyright © 2020 Shanu. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var bgview: UIView!
     @IBOutlet weak var lblName: UILabel!
     @IBOutlet weak var lblDuration: UILabel!
     @IBOutlet weak var btnPlay: UIButton!
     @IBOutlet weak var btnPause: UIButton!
     @IBOutlet weak var btnReplay: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
