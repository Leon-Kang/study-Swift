//
//  ViewController.swift
//  KLWebKit_Remote_Swift
//
//  Created by 康梁 on 16/1/25.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate
{

    var wkWebView: WKWebView!
    var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.google.com.hk")
        let request = NSURLRequest(URL: url!)
        
        self.addWkWebView()
        
        wkWebView.loadRequest(request)
        
        wkWebView.navigationDelegate = self
        
        wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        progressView.setProgress(Float(wkWebView.estimatedProgress), animated: false)
        
    }
    
    func addWkWebView() {
        wkWebView = WKWebView(frame: CGRectZero)
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(wkWebView)
        self.addProgress()
        self.addWkContraints()
    }
    
    func addWkContraints() {
        let viewMap = ["wkWebView": wkWebView, "progressView": progressView]
        let metrics = ["top": 20, "space": 0]
        
      var contraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-space-[wkWebView]-space-|", options: [], metrics: metrics, views: viewMap)
        
        contraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-top-[progressView][wkWebView]-|", options: [], metrics: metrics, views: viewMap)
        
        contraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-space-[progressView]-space-|", options: [], metrics: metrics, views: viewMap)
        
        self.view.addConstraints(contraints)
    }

    func addProgress() {
        progressView = UIProgressView(progressViewStyle: .Default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = UIColor.redColor()
        self.view.addSubview(progressView)
    }

    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        progressView.hidden = true
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.hidden = false
    }


}

