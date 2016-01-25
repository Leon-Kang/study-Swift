//
//  ViewController.swift
//  KLWebView_Local_Swift
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
        
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        
        webView.loadHTMLString(contents, baseURL: nil)
        
        webView.delegate = self
        
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.URL!
        print(url.scheme)
        
        let urlParts = url.absoluteString.componentsSeparatedByString(":")
        print(urlParts)
        
        let names = urlParts[1].componentsSeparatedByString("&")
        print(names)
        let methodName = names[0]
        let varName = names[1]
        
        let controller = UIAlertController(title: "js say", message: methodName + varName, preferredStyle: .Alert)
        let cancel = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        controller.addAction(cancel)
        self.presentViewController(controller, animated: true, completion: nil)
        
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
    // webView.stringByEvaluatingJavaScriptFromString("alert(\"hello, js\")")
        
    }

    


}

