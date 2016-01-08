//
//  FontName.swift
//  精灵
//
//  Created by 康梁 on 16/1/8.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit

func getFontName () {
    for familyName in UIFont.familyNames()
    {
        for fontName in UIFont.fontNamesForFamilyName(familyName) {
            print(fontName)
        }
    }
}
