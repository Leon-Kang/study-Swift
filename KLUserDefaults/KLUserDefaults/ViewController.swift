//
//  ViewController.swift
//  KLUserDefaults
//
//  Created by 康梁 on 16/1/15.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = ["box": 3, "age": 5]
        let standardDefaults = NSUserDefaults.standardUserDefaults()
        // 非固化存储
        standardDefaults.registerDefaults(defaults)
        // 固化存储
        standardDefaults.setObject(10, forKey: "box")
        
        print(standardDefaults.objectForKey("box"))
        
        // 创建文件夹
        let fileManager = NSFileManager.defaultManager()
        
        
        // Document
        let documentDirs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let documentDir = documentDirs[0]
        let newDirInDocDir = documentDir.URLByAppendingPathComponent("KL")
        
        do {
        try fileManager.createDirectoryAtURL(newDirInDocDir, withIntermediateDirectories: false, attributes: nil)
        } catch {
            print(error)
        }
        
        do {
        try fileManager.contentsOfDirectoryAtURL(documentDir, includingPropertiesForKeys: nil, options: [])
        } catch {
            print(error)
        }
        print(newDirInDocDir)
        
        // 删除
//        do {
//        try fileManager.removeItemAtURL(newDirInDocDir)
//        } catch {
//            print(error)
//        }
        
        
        
        // 临时目录
        let temporaryDirectory = NSTemporaryDirectory()
        let newTempDir = temporaryDirectory + "KL"
        let newTempDirURL = NSURL.fileURLWithPath(newTempDir)
        
        // 移动
        do {
            try fileManager.moveItemAtURL(newDirInDocDir, toURL: newTempDirURL)
        } catch {
            print(error)
        }
        
        // 创建文件
        let text = "KLLLLLLLLLLLLLLLLLLLLLL"
        let textData = text.dataUsingEncoding(NSUTF8StringEncoding)
        let textTemp = temporaryDirectory + "text"
        fileManager.createFileAtPath(textTemp, contents: textData, attributes: nil)
        
        print(textTemp)
    }
    
    
    

}

