//
//  SongsListTVCell.swift
//  SwiftStarterProject
//
//  Created by Pandey on 18/07/17.
//  Copyright © 2017 Pandey. All rights reserved.
//

import UIKit

class SongsListTVCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgViewSong: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
