//
//  ViewController.swift
//  testProject
//
//  Created by 康梁 on 15/12/24.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var KLView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sonwLayer = CUSSenderSnowLayer()
        
        
        let nibs = NSBundle.mainBundle().loadNibNamed("KLView", owner: self, options: nil)
        
        let showView = nibs[0] as! UIView
        
        let nibs_2 = NSBundle.mainBundle().loadNibNamed("KLView2", owner: self, options: nil)
        
        let showView2 = nibs_2[0] as! UIView
        
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        KLView.frame = CGRectMake(0, 0, width, height)
        KLView.pagingEnabled = true
        KLView.contentSize = CGSizeMake(3 * width, height)
        
        showView.frame = CGRectMake(0 * width, 0, width, height)
        showView2.frame = CGRectMake(1 * width, 0, width, height)
        
        KLView.addSubview(showView)
        KLView.addSubview(showView2)
        
        
        self.view.layer.addSublayer(sonwLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

