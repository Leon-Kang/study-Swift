//
//  TableViewCell.swift
//  KLCodeCell
//
//  Created by 康梁 on 16/1/20.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var lable: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lable = UILabel(frame: self.contentView.frame)
        lable.backgroundColor = UIColor.blueColor()
        lable.textColor = UIColor.whiteColor()
        self.contentView.addSubview(lable)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        
    }

}
