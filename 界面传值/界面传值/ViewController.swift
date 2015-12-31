//
//  ViewController.swift
//  界面传值
//
//  Created by 康梁 on 15/12/29.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TextViewControllerDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    var viewT: TextViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

//    @IBAction func getTextView(sender: AnyObject) {
//        
//        
//        self.presentViewController(viewT, animated: true, completion: nil)
//        
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! TextViewController
        
        controller.getText = {
            (text:String)
            in self.textLabel.text
        }
        controller.delegate = self
    }
    
    func getTextB(text: String) {
        textLabel.text = text
    }

}


