//
//  ViewController.swift
//  KLScenceKit
//
//  Created by 康梁 on 16/1/11.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class ViewController: UIViewController {

    var delegate: TapRecognizerDelegate?
    
    func tapped(tap:UITapGestureRecognizer) {
        let scnView = self.view as! SCNView
        delegate?.didTapped(tap, scnView: scnView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sceView = self.view as! SCNView
        
        sceView.backgroundColor = UIColor.grayColor()
        
        let scene = self.scene()
        
        sceView.scene = scene
        
        // 添加camera
        let cameraNode = self.createCameraNode()
        scene.rootNode.addChildNode(cameraNode)
        
        // 添加胶囊
        let capsuleNode = self.createCapsuleNode()
        scene.rootNode.addChildNode(capsuleNode)
        
        // 添加光源
        let ambientLight = self.createAmbientLightNode()
        scene.rootNode.addChildNode(ambientLight)
        
        // 添加泛光源
        let omniLight = self.omniLightNode()
        scene.rootNode.addChildNode(omniLight)
        
        // 添加动画
        let moveUpDowonAnimation = self.moveUpDowonAnimation()
        capsuleNode.addAnimation(moveUpDowonAnimation, forKey: "updown")
        
        // 添加文本
        let text = self.textNode()
        scene.rootNode.addChildNode(text)
        
        // 添加旋转动画
        let rotate = self.rotateAnimation()
        text.addAnimation(rotate, forKey: "rotate")
        
        // 添加点击事件
        let tapRecognizer = KLTapRecognizer()
        tapRecognizer.addTapRecognizer(self, view: sceView)
        
        let pyramid = GeometryConstraint.pyramid()
        GeometryConstraint.addConstraint(pyramid, toNode: capsuleNode)
        scene.rootNode.addChildNode(pyramid)
        
        let critterNode = DaeNode.nodeInDae()
        scene.rootNode.addChildNode(critterNode!)
        
        let pBody = KLPhysicBody.klPhysicBody(critterNode!)
        critterNode?.physicsBody = pBody
        
        KLFloor.addFloor(scene)
    }
    
    // 创建一个场景
    func scene() -> SCNScene {
        let scene = SCNScene()
        return scene
    }
    
    // 创建一个相机
    func createCamera() -> SCNCamera {
        let camera = SCNCamera()
        // 角度
        camera.xFov = 45
        camera.yFov = 45
        
        return camera
    }
    // 创建一个照相机节点
    func createCameraNode() -> SCNNode {
        let cameraNode = SCNNode()
        let camera = self.createCamera()
        cameraNode.camera = camera
        // 3D
        cameraNode.position = SCNVector3(0, 0, 20)
        
        return cameraNode
    }
    
    // 创建一个几何胶囊体
    func createCapsule() -> SCNCapsule {
        let capsule = SCNCapsule(capRadius: 3.0, height: 6)
        return capsule
    }
    // 创建一个胶囊节点
    func createCapsuleNode() -> SCNNode {
        let capsule = self.createCapsule()
        let capsuleNode = SCNNode(geometry: capsule)
        capsuleNode.position = SCNVector3(0, 0, 0)
        let klMaterial = KLMaterial()
        klMaterial.textureMaterial()
        capsule.materials = [klMaterial]
        return capsuleNode
    }

    // 添加光源
    func createAmbientLight() -> SCNLight {
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = UIColor(white: 0.25, alpha: 1)
        return ambientLight
    }
    // 添加光源的节点
    func createAmbientLightNode() -> SCNNode {
        let node = SCNNode()
        node.light = self.createAmbientLight()
        return node
    }
    
    // 添加泛光源节点
    func omniLight() -> SCNLight {
        let omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        return omniLight
    }
    // 添加泛光源节点
    func omniLightNode() -> SCNNode {
        let node = SCNNode()
        node.light = self.omniLight()
        node.position = SCNVector3Make(-5, 3, 3)
        return node
    }
    
    // 实现动画
    func moveUpDowonAnimation() -> CAAnimation {
        let moveUpDowonAnimation = CABasicAnimation(keyPath: "position")
        moveUpDowonAnimation.byValue = NSValue(SCNVector3:SCNVector3(0, 2, 0))
        moveUpDowonAnimation.timingFunction
        = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        moveUpDowonAnimation.autoreverses = true
        moveUpDowonAnimation.repeatCount = Float.infinity
        return moveUpDowonAnimation
    }
    
    // 创建几何文本
    func text() -> SCNText {
        let text = SCNText(string: "Hello,world!", extrusionDepth: 0.2)
        text.font = UIFont.systemFontOfSize(2)
        text.materials = [self.colorMaterial()]
        return text
    }
    // 创建几何文本节点
    func textNode() -> SCNNode {
        let textNode = SCNNode(geometry: self.text())
        textNode.position = SCNVector3(-3, 3, 0)
        return textNode
    }
    
    // 创建旋转动画
    func rotateAnimation() -> CAAnimation {
        let rotateAnimation = CABasicAnimation(keyPath: "eulerAngles")
        rotateAnimation.byValue = NSValue(SCNVector3: SCNVector3(0, Float(M_PI * 2), 0))
        rotateAnimation.repeatCount = Float.infinity
        rotateAnimation.duration = 4
        return rotateAnimation
    }
    
    // 为胶囊添加材质
    func colorMaterial() -> SCNMaterial {
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.redColor()
        material.specular.contents = UIColor.whiteColor()
        material.shininess = 1.0
        return material
    }
    
}

