//
//  RootTableViewCell.swift
//  starwars
//
//  Created by synesthesia on 7/7/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class RootTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
