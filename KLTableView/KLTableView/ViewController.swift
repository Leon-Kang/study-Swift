//
//  ViewController.swift
//  KLTableView
//
//  Created by 康梁 on 16/1/20.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...100 {
            numbers.append(i)
        }
        
        let tableView = UITableView()
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableView().dequeueReusableCellWithIdentifier("cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = String(numbers[indexPath.row])
        cell?.textLabel?.textColor = UIColor.blackColor()
        
        return cell!
    }

    

    

}

