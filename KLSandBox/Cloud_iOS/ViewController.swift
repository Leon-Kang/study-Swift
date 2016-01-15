//
//  ViewController.swift
//  Cloud_iOS
//
//  Created by 康梁 on 16/1/15.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    var stringValue: String? {
        get {
            return NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        }
        set {
            NSUbiquitousKeyValueStore.defaultStore().setString(newValue, forKey: "cloud_string")
            NSUbiquitousKeyValueStore.defaultStore().synchronize()
        }
    }
    
    var storeChangeObserver: AnyObject?
    
    // 接收无处不在的远程通知，并更改textFiled的键值对
    func createStoreChangeObserver() {
        self.storeChangeObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: self, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
            self.textField.text = NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createStoreChangeObserver()
        
        self.textField.delegate = self
        
        self.textField.text = NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        NSUbiquitousKeyValueStore.defaultStore().setString(self.textField.text, forKey: "cloud_string")
        
        return false
    }


}

