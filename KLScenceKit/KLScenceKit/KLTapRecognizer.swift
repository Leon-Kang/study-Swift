//
//  KLTapRecognizer.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit

protocol TapRecognizerDelegate {
    func didTapped(tapRecognizer: UITapGestureRecognizer,scnView: SCNView)
}

class KLTapRecognizer: NSObject, TapRecognizerDelegate {
    
    
    
    func addTapRecognizer(viewController: ViewController, view: SCNView) {
        let tapRecognizer = UITapGestureRecognizer(target: viewController, action: "tapped:")
        view.addGestureRecognizer(tapRecognizer)
        view.userInteractionEnabled = true
        viewController.delegate = self
    }
    
    func didTapped(tapRecognizer: UITapGestureRecognizer,scnView: SCNView) {
        if tapRecognizer.state == UIGestureRecognizerState.Ended {
            let hits = scnView.hitTest(tapRecognizer.locationInView(tapRecognizer.view), options: nil)
            
            for hit in hits {
                if let material = hit.node.geometry?.materials[0] {
                    let highLightAnimation = CABasicAnimation(keyPath: "contents")
                    highLightAnimation.fromValue = UIColor.blackColor()
                    highLightAnimation.toValue = UIColor.yellowColor()
                    highLightAnimation.duration = 1
                    material.emission.addAnimation(highLightAnimation, forKey: "highlight")
                }
            }
        }
    }
}
