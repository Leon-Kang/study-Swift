//
//  ViewController.swift
//  KLMotion_swift
//
//  Created by 康梁 on 16/1/22.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
    @IBOutlet weak var yawLabel: UILabel!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CMPedometer.isStepCountingAvailable() {
            print("available")
        } else {
            print("unavailable")
        }
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            print("available")
        } else {
            print("unavailable")
        }
        
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (motion, error) -> Void in
            
            let xStr = String(format: "%.2f", (motion?.userAcceleration.x)!)
            self.xLabel.text = xStr
            
            let yStr = String(format: "%.2f", (motion?.userAcceleration.y)!)
            self.yLabel.text = yStr
            
            let zStr = String(format: "%.2f", (motion?.userAcceleration.z)!)
            self.zLabel.text = zStr
            
//            let xStr = String(format: "%.2f", (motion?.gravity.x)!)
//            self.xLabel.text = xStr
//            
//            let yStr = String(format: "%.2f", (motion?.gravity.y)!)
//            self.yLabel.text = yStr
//            
//            let zStr = String(format: "%.2f", (motion?.gravity.z)!)
//            self.zLabel.text = zStr

            
            let pitch = String(format: "%.2f", (motion?.attitude.pitch)! * 180 / M_PI )
            self.pitchLabel.text = pitch
            
            let roll = String(format: "%.2f", (motion?.attitude.roll)! * 180 / M_PI)
            self.rollLabel.text = roll
            
            let yaw = String(format: "%.2f", (motion?.attitude.yaw)! * 180 / M_PI)
            self.yawLabel.text = yaw
        }
        
    }




}

