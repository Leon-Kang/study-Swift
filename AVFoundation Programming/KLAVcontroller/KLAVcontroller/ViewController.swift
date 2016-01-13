//
//  ViewController.swift
//  KLAVcontroller
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "videoSegue" {
            let controller = segue.destinationViewController as! AVPlayerViewController
            
            let url = NSBundle.mainBundle().URLForResource("TestVideo", withExtension: "m4v")
            let player = AVPlayer(URL: url!)
            
            controller.player = player
        }
    }
    
    
}

