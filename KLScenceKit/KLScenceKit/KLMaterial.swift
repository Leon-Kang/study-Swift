//
//  KLMaterial.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class KLMaterial: SCNMaterial {
    func textureMaterial(noiseTextture: SKTexture? = SKTexture(noiseWithSmoothness: 0.25, size: CGSize(width: 512, height: 512), grayscale: true))
    {
        let normalTexture = noiseTextture?.textureByGeneratingNormalMapWithSmoothness(0.1, contrast: 1)
        self.normal.contents = normalTexture
        self.diffuse.contents = noiseTextture
        
    }
    
}
