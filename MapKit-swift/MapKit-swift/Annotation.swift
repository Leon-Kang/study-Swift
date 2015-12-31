//
//  Annotation.swift
//  MapKit-swift
//
//  Created by 康梁 on 15/12/29.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit
import MapKit

class Annotation: MKPointAnnotation {

    init(title: String, subTitle: String, coordiante:CLLocationCoordinate2D) {
        super.init()
        self.title = title
        self.subtitle = subTitle
        self.coordinate = coordiante
    }
    
}
