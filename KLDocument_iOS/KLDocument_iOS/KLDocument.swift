//
//  KLDocument.swift
//  KLDocument_iOS
//
//  Created by 康梁 on 16/1/18.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class KLDocument: UIDocument {

    
    var text = " "
    
    
    override func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {
        
        self.text = String(data: contents as! NSData, encoding: NSUTF8StringEncoding)!
        
    }
    
    override func contentsForType(typeName: String) throws -> AnyObject {
        
        
        return self.text.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    
}
