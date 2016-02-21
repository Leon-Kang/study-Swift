//
//  DetailViewController.swift
//  KLDocument_iOS
//
//  Created by 康梁 on 16/1/18.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var textView: UITextView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let document = self.detailItem as? KLDocument {
            if let aTextView = self.textView {
                document.text = aTextView.text
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        if let document = self.detailItem as? KLDocument {

            document.text = self.textView.text
            document.saveToURL(document.fileURL, forSaveOperation: .ForOverwriting, completionHandler: {(success) -> Void in
                if success {
                 
                }
                
            })
            
        }
    }


}

