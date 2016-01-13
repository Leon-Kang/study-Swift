//
//  KLFloor.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit

class KLFloor: NSObject {

    static func addFloor(scene: SCNScene) {
        let floor = SCNFloor()
        let node = SCNNode(geometry: floor)
        node.position = SCNVector3(0, -4, 0)
        let body = SCNPhysicsBody(type: .Static, shape: SCNPhysicsShape(geometry: floor, options: nil))
        node.physicsBody = body
        scene.rootNode.addChildNode(node)
    }
}
