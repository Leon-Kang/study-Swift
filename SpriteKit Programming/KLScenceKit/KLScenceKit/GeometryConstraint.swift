//
//  GeometryConstraint.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit


class GeometryConstraint: NSObject {
    static func pyramid() -> SCNNode {
        let pyramid = SCNPyramid(width: 0.5, height: 0.9, length: 4.0)
        let node = SCNNode(geometry: pyramid)
        node.position = SCNVector3(-5, 0, 0)
        
        return node
        
    }
    
    static func addConstraint(fromNode: SCNNode, toNode: SCNNode) {
        let lookAtConstraint = SCNLookAtConstraint(target: toNode)
        lookAtConstraint.gimbalLockEnabled = true
        
        fromNode.constraints = [lookAtConstraint]
    }
}
