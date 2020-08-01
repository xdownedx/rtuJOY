//
//  settingCell.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 21.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class settingCell: UITableViewCell {

    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
