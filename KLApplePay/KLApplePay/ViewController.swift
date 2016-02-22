//
//  ViewController.swift
//  KLApplePay
//
//  Created by 康梁 on 16/2/21.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit
import PassKit

class ViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func payBtn(sender: AnyObject) {
        
        // 1.判断环境是否支持applePay
        if PKPaymentAuthorizationViewController.canMakePayments() {
            // 2.判断是否有可用的卡信息
            if PKPaymentAuthorizationViewController.canMakePaymentsUsingNetworks([PKPaymentNetworkAmex, PKPaymentNetworkDiscover, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa], capabilities: .CapabilityCredit) {
                
                let request = self.PaymentRequest()
                let paymentVC = PKPaymentAuthorizationViewController(paymentRequest: request)
                paymentVC.delegate = self
                
                self.presentViewController(paymentVC, animated: true, completion: nil)
                
            } else {
                self.turnToPaymentSetup()
            }
            
        } else {
            let alertCon = UIAlertController(title: "Sorry", message: "The device does not support Apple Pay", preferredStyle: .Alert)
            let cancel = UIAlertAction(title: "cancel", style: .Cancel, handler: { (UIAlertAction) -> Void in
                alertCon.dismissViewControllerAnimated(true, completion: nil)
            })
            alertCon.addAction(cancel)
            self.presentViewController(alertCon, animated: true, completion: nil)
        }
        
    }
    
    func turnToPaymentSetup () {
        let alertCon = UIAlertController(title: "Something wrong", message: "Do you want to set up credit cards for Apple Pay", preferredStyle: .Alert)
        let cancelAct = UIAlertAction(title: "cancel", style: .Cancel, handler: { (UIAlertAction) -> Void in
            alertCon.dismissViewControllerAnimated(true, completion: nil)
        })
        alertCon.addAction(cancelAct)
        let okAct = UIAlertAction(title: "ok", style: .Default, handler: { (UIAlertAction) -> Void in
            // Opens the user interface to set up credit cards for Apple Pay.
            let passLib: PKPassLibrary = PKPassLibrary()
            passLib.openPaymentSetup()
            alertCon.dismissViewControllerAnimated(true, completion: nil)
        })
        alertCon.addAction(okAct)
        self.presentViewController(alertCon, animated: true, completion: nil)
    }
    
    func PaymentRequest () -> PKPaymentRequest
    {
        let PayRequest = PKPaymentRequest()
        PayRequest.currencyCode = "USD"
        PayRequest.countryCode = "CN"
        PayRequest.merchantIdentifier = "merchant.com.testMyApplePay"
        
        PayRequest.supportedNetworks = [PKPaymentNetworkAmex, PKPaymentNetworkDiscover, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa]
        
        // Supports 3DS only
        PayRequest.merchantCapabilities = .Capability3DS
        
        // 产品信息
        let myFood1 = PKPaymentSummaryItem(label: "beef", amount: 1.5, type: .Pending)
        let myFood2 = PKPaymentSummaryItem(label: "noodle", amount: 4, type: .Pending)
        PayRequest.paymentSummaryItems = [myFood1, myFood2]

        return PayRequest
    }

    // MARK: Payment Delegate
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: (PKPaymentAuthorizationStatus) -> Void) {
        print("paymentAuthorizationViewController")
    }
    
    
    func paymentAuthorizationViewControllerDidFinish(controller: PKPaymentAuthorizationViewController) {
        print("Did Finish")
    }
    
    
    func paymentAuthorizationViewControllerWillAuthorizePayment(controller: PKPaymentAuthorizationViewController) {
        print("WillAuthorizePayment")
    }
    
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didSelectShippingMethod shippingMethod: PKShippingMethod, completion: (PKPaymentAuthorizationStatus, [PKPaymentSummaryItem]) -> Void) {
        
    }
    
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didSelectShippingAddress address: ABRecord, completion: (PKPaymentAuthorizationStatus, [PKShippingMethod], [PKPaymentSummaryItem]) -> Void) {
        
    }
    
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didSelectShippingContact contact: PKContact, completion: (PKPaymentAuthorizationStatus, [PKShippingMethod], [PKPaymentSummaryItem]) -> Void) {
        
    }
    
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didSelectPaymentMethod paymentMethod: PKPaymentMethod, completion: ([PKPaymentSummaryItem]) -> Void) {
        
    }
    
    
    
    func doSomething(state: PKPaymentAuthorizationStatus) {
        switch (state) {
        // Failed payment authorization.
        case .Failure:
            
            break;
        // Invalid or unusable billing address.
        case .InvalidBillingPostalAddress:
            break
        // Invalid or incomplete shipping contact.
        case .InvalidShippingContact:
            break
        // Invalid or unusable shipping address.
        case .InvalidShippingPostalAddress:
            break
        // PIN was not entered correctly, retry.
        case .PINIncorrect:
            break
        // PIN retry limit exceeded.
        case .PINLockout:
            break
        // Transaction requires PIN entry.
        case .PINRequired:
            break
        // Successful payment authorization, or the transaction is expected to succeed.
        case .Success:
            break
        
        }
    }
    

}

