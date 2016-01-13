//
//  ViewController.swift
//  KLSpeech
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import AVFoundation

var synthesizer = AVSpeechSynthesizer()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let utterance = AVSpeechUtterance(string: "hello world")
        
        let utteranceCN = AVSpeechUtterance(string: "吃葡萄不吐葡萄皮，不吃葡萄倒吐葡萄皮")
        
        utterance.rate = 2
        utterance.pitchMultiplier = 2
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        
        synthesizer.speakUtterance(utteranceCN)
    }

    

}

