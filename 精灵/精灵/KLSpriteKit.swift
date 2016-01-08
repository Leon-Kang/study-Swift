//
//  KLSpriteKit.swift
//  精灵
//
//  Created by 康梁 on 16/1/8.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SpriteKit

class KLSpriteKit: SKScene {

    override func didMoveToView(view: SKView) {
        let spriteNode = SKSpriteNode(imageNamed: "hero-squat")
        
        spriteNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        self.addChild(spriteNode)
        
        self.addSpriteNodeWithSKTexture()
        
        self.addSpriteNodeUsingTextureAtlas()
    }
    
    
    /**
     使用Texture增加图片
     */
    func addSpriteNodeWithSKTexture () {
        let texture = SKTexture(imageNamed: "BlockSquareRed")
        
        let node = SKSpriteNode(texture: texture)
        
        node.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        self.addChild(node)
    }
    
    /**
     使用TextureAtlas增加
     */
    func addSpriteNodeUsingTextureAtlas () {
        let atlas = SKTextureAtlas(named: "Sprites")
        
        let texture = atlas.textureNamed("BlockSquareBlue");
        
        let node = SKSpriteNode(texture: texture)
        
        node.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        self.addChild(node)
        
    }
    
}
