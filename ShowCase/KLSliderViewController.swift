//
//  KLSliderViewController.swift
//  ShowCase
//
//  Created by 康梁 on 16/1/4.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit


class KLSliderViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderAlpha: UISlider!
    
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var BlueValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    
    var alpha = CGFloat.init(1.0)
    var redColor = CGFloat.init(1.0)
    var blueColor = CGFloat.init(1.0)
    var greenColor = CGFloat.init(1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redValue.delegate = self
        BlueValue.delegate = self
        greenValue.delegate = self
        
    }
    
    @IBAction func changred(sender: AnyObject) {
        let red = sliderRed.value
        redColor = CGFloat.init(red)
        redValue.text = String(stringInterpolationSegment: red)
        self.changeBackgroundColor()
    }
    
    @IBAction func changeBlue(sender: AnyObject) {
        let blue = sliderBlue.value
        blueColor = CGFloat.init(blue)
        BlueValue.text = String(stringInterpolationSegment: blue)
        self.changeBackgroundColor()
        
    }
    
    @IBAction func changeGreen(sender: AnyObject) {
        let green = sliderGreen.value
        greenColor = CGFloat.init(green)
        greenValue.text = String(stringInterpolationSegment: green)
        self.changeBackgroundColor()
        
    }
    
    @IBAction func changeAlpha(sender: AnyObject) {
        alpha = CGFloat.init(sliderAlpha.value)
        self.changeBackgroundColor()
    }
    
    func changeBackgroundColor () {
        self.view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: alpha)
    }
}
