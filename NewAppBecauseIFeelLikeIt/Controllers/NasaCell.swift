//
//  NasaCell.swift
//  NewAppBecauseIFeelLikeIt
//
//  Created by Olimpia on 9/2/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class NasaCell: UITableViewCell {
    
    @IBOutlet weak var nasaImage: UIImageView!
    
    @IBOutlet weak var nasaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
