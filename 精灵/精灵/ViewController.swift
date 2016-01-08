//
//  ViewController.swift
//  精灵
//
//  Created by 康梁 on 16/1/8.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // lableScence
        let skView = self.view as! SKView
        
        let lblScence = TextScene(size: skView.frame.size)
        
        // skView.presentScene(lblScence)
        
        
        // shapeScence
        let spScence = KLShapeScene(size: skView.frame.size)
        skView.presentScene(spScence)
        
        getFontName()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

