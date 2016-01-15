//
//  ViewController.swift
//  KLSandBox
//
//  Created by 康梁 on 16/1/15.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

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
            self.willChangeValueForKey("cloud_string")
            self.didChangeValueForKey("cloud_string")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 沙盒
        let pannel = NSOpenPanel()
        pannel.canChooseDirectories = true
        pannel.canChooseFiles = true
        
        pannel.beginWithCompletionHandler { (result) -> Void in
            _ = pannel.URL
        
        }
        
        // iCloud
        let backgroundQueue = NSOperationQueue()
        
        backgroundQueue.addOperationWithBlock { () -> Void in
            let ubiquityContainerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
            print("Ubiquity container URL:\(ubiquityContainerURL)")
        }
        
        self.createStoreChangeObserver()
    }




}

