//
//  ViewController.swift
//  KLShare_swift
//
//  Created by 康梁 on 16/1/22.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    /**
     分享文本
     
     - parameter sender: sender description
     */
    @IBAction func shareText(sender: AnyObject) {
        
        let text = "share text"
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.presentViewController(activityController, animated: true) { () -> Void in
            
        }
        
    }

    /**
     分享图片
     
     - parameter sender: sender description
     */
    @IBAction func shareImage(sender: AnyObject) {
        
        if let image = imageView.image {
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        }
        
        
        
    }

}

