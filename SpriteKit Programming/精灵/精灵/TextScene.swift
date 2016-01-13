//
//  TextScene.swift
//  精灵
//
//  Created by 康梁 on 16/1/8.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SpriteKit

class TextScene: SKScene {
    
    let textNode = SKLabelNode(text: "Hello, Sprite")
    
    override func didMoveToView(view: SKView)
    {
        
        
        textNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        textNode.fontName = "Zapfino"
        textNode.fontSize = 33
        textNode.fontColor = UIColor.redColor()
        
        self.addChild(textNode)
        
        
        // self.addMoveAction(textNode)
        
        // self.addRotation(textNode)
        
        // self.removeAction(textNode)
        
        self.groupAction(textNode)
        
    }
    
    /**
     偏移
     
     - parameter node: <#node description#>
     */
    func addMoveAction (node: SKLabelNode) -> SKAction {
        let moveAction = SKAction.moveBy(CGVector(dx: 0, dy: 270), duration: 1)
        
        node.runAction(moveAction)
        return moveAction;
    }
    
    /**
     上下偏移
     
     - parameter node: <#node description#>
     */
    func removeAction (node: SKLabelNode) -> SKAction{
        let moveAction = SKAction.moveBy(CGVector(dx: 0, dy: 120), duration: 1)
        
        let reversedAction = moveAction.reversedAction()
        
        let sequenceAction = SKAction.sequence([moveAction, reversedAction])
        
        let repeatAction = SKAction.repeatActionForever(sequenceAction)
        
        // node.runAction(repeatAction)
        
        return repeatAction
    }
    
    /**
     旋转
     
     - parameter node: <#node description#>
     */
    func addRotation (node: SKLabelNode) -> SKAction{
        let rotationActive = SKAction.rotateToAngle(CGFloat(M_PI * 2), duration: 1)
        
        let repeatAction = SKAction.repeatActionForever(rotationActive)
        
        // node.runAction(repeatAction)
        
        return repeatAction
    }
    
    /**
     放大缩小
     
     - parameter node: <#node description#>
     */
    func addScale (node: SKLabelNode) -> SKAction {
        let scale = SKAction.scaleBy(2, duration: 1)
        
        let reverseA = scale.reversedAction()
        
        let scaleSmall = SKAction.scaleBy(0.5, duration: 1)
        
        let reverseSmall = scaleSmall.reversedAction()
        
        let sequenceAction = SKAction.sequence([reverseA, reverseSmall])
        
        let repeatAction = SKAction.repeatActionForever(sequenceAction)
        
        // node.runAction(repeatAction)
        
        return repeatAction
    }
    
    /**
     使用group添加动画同时运行
     
     - parameter node: <#node description#>
     */
    func groupAction (node: SKLabelNode) {
        let moveAction = self.removeAction(node)
        
        let rotation = self.addRotation(node)
        
        let scale = self.addScale(node)
        
        let group = SKAction.group([moveAction, rotation, scale])
        
        node.runAction(group)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {

        let spiriteScene = KLSpriteKit(size: (self.view?.frame.size)!)
        
        // let transition = SKTransition.moveInWithDirection(.Left, duration: 1)

        let transition = SKTransition.doorsCloseHorizontalWithDuration(1)
        
        self.view?.presentScene(spiriteScene, transition: transition)
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
















