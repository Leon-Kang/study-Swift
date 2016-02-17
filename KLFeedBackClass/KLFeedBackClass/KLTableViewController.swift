//
//  KLTableViewController.swift
//  KLFeedBackClass
//
//  Created by 康梁 on 16/2/17.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class KLTableViewController: UITableViewController, UITextFieldDelegate {
    
    let contaxt = ["电话", "QQ", "邮件"]
    var userDic = ["phone": " " ,"QQ": " " , "Email": " " , "Form": " "]
    
    @IBAction func submit(sender: AnyObject) {
        KLPostFeedBack.postData(self.userDic["QQ"]!, email: self.userDic["Email"]!, Form: self.userDic["Form"]!, phone: self.userDic["phone"]!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch (section) {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 1
    
        default:
            break;
        }
        return 0
    }
    
    // Cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        switch (indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCell", forIndexPath: indexPath) as! TableTextFieldCell
            cell.label.text = contaxt[indexPath.row]
            cell.textField.tag = indexPath.row
            cell.textField.delegate = self
            return cell
            
        case 1:
            let formCell = tableView.dequeueReusableCellWithIdentifier("FormCell", forIndexPath: indexPath) as! TableFormCell
            formCell.lable.tag = 3
            formCell.lable.delegate = self
            return formCell
            
        case 2:
            let btnCell = tableView.dequeueReusableCellWithIdentifier("ButtonCell", forIndexPath: indexPath) as! TableButtonCell
            return btnCell
            
        default:
            break;
        }
        
        let cellZero = tableView.dequeueReusableCellWithIdentifier("TextFieldCell", forIndexPath: indexPath)
    
        return cellZero
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 250
        }
        return 44
    }
    
    
    
    // TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        switch (textField.tag) {
        case 0:
            self.userDic["phone"] = textField.text!
            break
        case 1:
            self.userDic["QQ"] = textField.text!
            break
        case 2:
            self.userDic["Email"] = textField.text!
            break
        case 3:
            self.userDic["Form"] = textField.text!
            break
        default:
            break
        }
        print(self.userDic)
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
