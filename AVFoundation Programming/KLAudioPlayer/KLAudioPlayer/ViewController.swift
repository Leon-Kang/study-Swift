//
//  ViewController.swift
//  KLAudioPlayer
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addAudioPlayer("TestSound", extention: "wav")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addAudioPlayer(name: String, extention: String) {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: extention)
        try! audioPlayer = AVAudioPlayer(contentsOfURL: url!)
        
        audioPlayer.numberOfLoops = -1
        audioPlayer.volume = 1
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
    }

}

