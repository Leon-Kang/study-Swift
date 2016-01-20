//
//  KLTableViewCell.swift
//  KLXibCell
//
//  Created by 康梁 on 16/1/20.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class KLTableViewCell: UITableViewCell {

    @IBOutlet weak var lable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
