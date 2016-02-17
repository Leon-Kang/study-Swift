//
//  TableTextFieldCell.swift
//  KLFeedBackClass
//
//  Created by 康梁 on 16/2/17.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class TableTextFieldCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
