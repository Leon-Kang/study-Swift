//
//  ViewController.swift
//  KLWebKit_Handler
//
//  Created by 康梁 on 16/1/25.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler
{

    
    var klWebKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userScipt = WKUserScript(source: "", injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScipt)
        
        userContentController.addScriptMessageHandler(self, name: "ZZXX")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        klWebKit = WKWebView(frame: self.view.bounds, configuration: configuration)
        
        let url = NSURL(string: "http://www.jianshu.com")
        let request = NSURLRequest(URL: url!)
        klWebKit.loadRequest(request)
        
        
        self.view.addSubview(klWebKit)
        
        
    }
    

}

typealias wkScriptMessageHandler = ViewController

extension wkScriptMessageHandler {
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        
        print(message.body)
        print(message.name)
        
        
    }
}