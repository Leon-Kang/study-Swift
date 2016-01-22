//
//  ViewController.swift
//  KLPedometer_swift
//
//  Created by 康梁 on 16/1/22.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var pedometerLabel: UILabel!
    
    @IBOutlet weak var stepsLabel: UILabel!
    
    var pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CMPedometer.isStepCountingAvailable() {
            
            let oneDayAgo = NSDate(timeInterval: -24 * 60 * 60, sinceDate: NSDate())
            
            pedometer.queryPedometerDataFromDate(oneDayAgo, toDate: NSDate()) { (CMPedometerData, error) -> Void in
                self.stepsLabel.text = String(format: "%@", (CMPedometerData?.numberOfSteps)!)
            }
        } else {
            self.pedometerLabel.text = "no available"
        }
        
        pedometer.startPedometerUpdatesFromDate(oneDayAgo()) { (data, error) -> Void in
            if let steps = data?.numberOfSteps {
                self.pedometerLabel.text = String(format: "%@", steps)
            }
        }
        
        
    }


    
    func oneDayAgo() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
        
        return date!
    }

}

