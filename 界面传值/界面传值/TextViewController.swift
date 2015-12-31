//
//  TextViewController.swift
//  界面传值
//
//  Created by 康梁 on 15/12/29.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit

protocol
TextViewControllerDelegate {
    func getTextB(text: String)
}



typealias StringVoid = (String) -> ()

class TextViewController: UIViewController, UITextViewDelegate

{

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    var delegate: ViewController?
    
    var getText:StringVoid!
    
//    @IBAction func getViewC(sender: AnyObject) {
//        
//        
//        self.dismissViewControllerAnimated(true, completion: nil)
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func textViewDidEndEditing(textView: UITextView) {
        // getText(textView.text)
        delegate?.getTextB(textView.text)
}

    
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
