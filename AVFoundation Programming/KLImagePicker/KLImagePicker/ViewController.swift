//
//  ViewController.swift
//  KLImagePicker
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func takePoto(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let pickerController = UIImagePickerController()
            pickerController.sourceType = .Camera
            
            if UIImagePickerController.isCameraDeviceAvailable(.Front) {
                pickerController.cameraDevice = .Front
            } else {
                pickerController.cameraDevice = .Rear
            }
            
            pickerController.delegate = self
            self.presentViewController(pickerController, animated: true, completion: nil)
        }
        
    }

    @IBAction func addAction(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .SavedPhotosAlbum
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }

    @IBAction func libraryAction(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageView.image = editingInfo![UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

