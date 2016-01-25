//
//  ViewController.swift
//  KLWebView_Remote_Swift
//
//  Created by 康梁 on 16/1/25.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate
{

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.google.com.hk")
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
        webView.delegate = self
        
    }


    //MARK: UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldStartLoadWithRequest")
        
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print(__FUNCTION__)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print(__FUNCTION__)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(__FUNCTION__)
    }

}

