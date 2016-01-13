//
//  KLShapeScene.swift
//  精灵
//
//  Created by 康梁 on 16/1/8.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SpriteKit

class KLShapeScene: SKScene {

    override func didMoveToView(view: SKView) {
        
        
        
        let rectNode = self.rectangleNode()
        
        self.addChild(rectNode)
        
        self.addPhysicBody(rectNode)
        self.addWalls()
        
        let circleNode = self.circleNode()
        
        self.addChild(circleNode)
        
        let cicleBody = SKPhysicsBody(circleOfRadius: 20)
        cicleBody.dynamic = false
        
        circleNode.physicsBody = cicleBody
        
        
        let pinJoin = SKPhysicsJointPin.jointWithBodyA(circleNode.physicsBody!, bodyB: rectNode.physicsBody!, anchor: circleNode.position)
        
        self.physicsWorld.addJoint(pinJoin)
        
        
        
        
        self.view?.showsPhysics = true
        
        
        // TEST LINECAP
//        let customShape = self.customShape()
//        
//        self.addChild(customShape)
        
        
//        let width = customShape.frame.size.width
//        let height = customShape.frame.size.height
//        
//        let customShape1 = customShape.copy() as! KLCopyShapeNode
//        customShape1.position = CGPoint(x: width + 10, y: height + 10)
//        customShape1.lineCap = .Square
//        self.addChild(customShape1 as SKNode)
//        
//        let customShape2 = customShape.copy() as!KLCopyShapeNode
//        customShape2.position = CGPoint(x: width * 2 + 20, y: height * 2 + 20)
//        customShape2.lineCap = .Butt
//        self.addChild(customShape2 as SKNode)
        
    }
    
    /**
     add a circleNode
     
     - returns: circleNode
     */
    func circleNode () -> SKShapeNode {
        let scircleNode = SKShapeNode(circleOfRadius: 20.0)
        
        scircleNode.fillColor = UIColor.blueColor()
        scircleNode.strokeColor = UIColor.redColor()
        scircleNode.lineWidth = 5
        
        scircleNode.position = CGPoint(x: size.width / 2, y: size.height / 2 + 200)
        
        return scircleNode
    }
    
    /**
     给矩形添加物理属性
     
     - parameter node: 传入的SKShapeNode
     */
    func addPhysicBody (node: SKShapeNode) {
        let rectPhysicBody = SKPhysicsBody(rectangleOfSize: node.frame.size)
        
        rectPhysicBody.mass = 1
        // rectPhysicBody.dynamic = false
        
        node.physicsBody = rectPhysicBody
    }
    
    /**
     添加一个挡板（墙）
     */
    func addWalls () {
        let wall = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = wall
    }
    
    
    /**
     画一个矩形
     
     - returns: rectangleNode
     */
    func rectangleNode () -> SKShapeNode {
        let rectNode = SKShapeNode(rectOfSize: CGSize(width: 100, height: 100))
        
        rectNode.fillColor = UIColor.orangeColor()
        rectNode.strokeColor = UIColor.lightGrayColor()
        rectNode.lineWidth = 2
        
        rectNode.position = CGPoint(x: size.width / 2 - 50, y: size.height / 2 + 100)
        
        return rectNode
    }
    
    /**
     画一个三角形
     
     - returns: SKShapeNode
     */
    func customShape () -> KLCopyShapeNode
    {
        let bezier = UIBezierPath()
        
        let bottomLeft = CGPoint(x: 20, y: 20)
        
        let bottomRight = CGPoint(x: 100, y: 20)
        
        let topRight = CGPoint(x: 100, y: 200)
        
        bezier.moveToPoint(bottomLeft)
        
        bezier.addLineToPoint(bottomRight)
        
        bezier.addLineToPoint(topRight)
        
        let pathShape = KLCopyShapeNode(path: bezier.CGPath)
        
        pathShape.strokeColor = UIColor.redColor()
        pathShape.lineWidth = 15
        
        
        pathShape.lineCap = .Round
        
        return pathShape
    }
    
    
    
    
    
    
}
