//
//  ViewController.swift
//  KLWebKit_JS
//
//  Created by 康梁 on 16/1/25.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var klWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        
        klWebView = WKWebView(frame: self.view.bounds)
        
        klWebView.loadHTMLString(contents, baseURL: nil)
        
        self.view.addSubview(klWebView)
        
        klWebView.UIDelegate = self
        
    }


    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        
        let alertController = UIAlertController(title: "javascript", message: message, preferredStyle: .Alert)
        
        let cancel = UIAlertAction(title: "ok", style: .Cancel) { (UIAlertAction) -> Void in
            completionHandler()
        }
        alertController.addAction(cancel)
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {
        
        let alertController = UIAlertController(title: "javascript confirm", message: message, preferredStyle: .Alert)
        
        let cancel = UIAlertAction(title: "ok", style: .Cancel) { (UIAlertAction) -> Void in
            completionHandler(true)
        }
        alertController.addAction(cancel)
        let nocancel = UIAlertAction(title: "no", style: .Default) { (UIAlertAction) -> Void in
            completionHandler(false)
        }
        alertController.addAction(nocancel)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
        
        let alertController = UIAlertController(title: prompt, message: defaultText, preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = "0"
            
        }
        
        let cancel = UIAlertAction(title: "ok", style: .Cancel) { (UIAlertAction) -> Void in
            completionHandler(alertController.textFields![0].text)
        }
        alertController.addAction(cancel)

        
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

