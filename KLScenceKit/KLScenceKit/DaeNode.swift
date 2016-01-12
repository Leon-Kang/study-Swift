//
//  DaeNode.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit

class DaeNode: NSObject {
    static func daeDataFromResource(name:String, type:String) -> SCNSceneSource
    {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: type)
        let daeSource = SCNSceneSource(URL: url!, options: nil)
        
        return daeSource!
    }
    
    static func nodeInDae() -> SCNNode? {
        let dae = DaeNode.daeDataFromResource("Critter", type: "dae")
        let node = dae.entryWithIdentifier("Critter", withClass: SCNNode.self)
        
        if node != nil {
            node?.position = SCNVector3(5, 0, 0)
            return node!
        } else {
            return nil
        }
    }
    
}
