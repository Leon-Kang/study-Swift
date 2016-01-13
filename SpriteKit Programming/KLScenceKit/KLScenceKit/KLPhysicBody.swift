//
//  KLPhysicBody.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit
class KLPhysicBody: NSObject {

    static func klPhysicBody(node: SCNNode) -> SCNPhysicsBody {
        var shape: SCNPhysicsShape?
        
        if let geometry = node.geometry {
            shape = SCNPhysicsShape(geometry: geometry, options: nil)
        }
        
        let pBody = SCNPhysicsBody(type: .Dynamic, shape: shape)
        return pBody
    }
    
}
