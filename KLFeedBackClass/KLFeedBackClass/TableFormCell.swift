//
//  TableFormCell.swift
//  KLFeedBackClass
//
//  Created by 康梁 on 16/2/17.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class TableFormCell: UITableViewCell {

    @IBOutlet weak var lable: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
