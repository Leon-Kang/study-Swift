//
//  KLPostFeedBack.swift
//  KLFeedBackClass
//
//  Created by 康梁 on 16/2/17.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class KLPostFeedBack: NSObject {

    class func postData(qq: String, email: String, Form: String, phone: String) {
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "http://112.124.122.38/acountingExam/feedback.php")
        let request = NSMutableURLRequest(URL: url!)
        let para = String(format: "qq=%@&tel=%@&email=%@&content=%@&", qq, phone, email, Form)
        request.HTTPMethod = "POST"
        request.HTTPBody = para.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            let recievedStr = String(data: data!, encoding: NSUTF8StringEncoding)
            print(recievedStr)
        }
        task.resume()
    }
    
    
    
    
}
