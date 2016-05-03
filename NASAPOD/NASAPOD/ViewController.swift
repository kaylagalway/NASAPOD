//
//  ViewController.swift
//  NASAPOD
//
//  Created by Kayla Galway on 4/27/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

import UIKit
import ImageScrollView

class ViewController: UIViewController {
    
    @IBOutlet weak var imageFromToday: UIImageView!
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextview: UITextView!
    @IBOutlet weak var viewFullImageButton: UIButton!
    @IBOutlet weak var podLabel: UILabel!
    @IBOutlet weak var savePhotoButton: UIButton!
    @IBOutlet weak var clickImageLabel: UILabel!
    @IBOutlet weak var showTextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFullImageButton.alpha = 0
        showTextButton.alpha = 0
        clickImageLabel.alpha = 0
        savePhotoButton.alpha = 0
        
        
        
        getPicture { (pictureDict) in
            print(pictureDict)
            let pictureURLstring: String = pictureDict["url"] as! String
            let pictureURL = NSURL(string: pictureURLstring)
            let titleString:String = pictureDict["title"] as! String
            let infoString:String = pictureDict["explanation"] as! String
            print(titleString)
            
            self.performSelectorOnMainThread(#selector(ViewController.updateMainPhoto(_:)), withObject: pictureURL, waitUntilDone: true)
            self.performSelectorOnMainThread(#selector(ViewController.updateTitleLabel(_:)), withObject: titleString, waitUntilDone: true)
            self.performSelectorOnMainThread(#selector(ViewController.updateInfoText(_:)), withObject: infoString, waitUntilDone: true)
        }
    }
    
    @IBAction func showTextButtonTapped(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
            self.bannerLabel.alpha = 0
            self.titleLabel.alpha = 0
            self.infoTextview.alpha = 0
            self.podLabel.alpha = 0
            self.showTextButton.alpha = 0
            self.savePhotoButton.alpha = 0
        })
        UIView.animateWithDuration(0.75, delay: 0.5, options:.CurveEaseIn, animations: {
            self.clickImageLabel.alpha = 1
        }) { (Bool) in
            UIView.animateWithDuration(0.5, delay: 1.0, options: .CurveEaseOut, animations: { 
                self.clickImageLabel.alpha = 0
                }, completion: { (Bool) in
            })
        }

        
        
        self.imageFromToday.userInteractionEnabled = true
        //now you need a tap gesture recognizer
        //note that target and action point to what happens when the action is recognized.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(_:)))
        //Add the recognizer to your view.
        imageFromToday.addGestureRecognizer(tapRecognizer)
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        //tappedImageView will be the image view that was tapped.
        //dismiss it, animate it off screen, whatever.
        UIView.animateWithDuration(0.5, animations: {
            self.bannerLabel.alpha = 1
            self.titleLabel.alpha = 1
            self.infoTextview.alpha = 1
            self.podLabel.alpha = 1
            self.showTextButton.alpha = 1
            self.savePhotoButton.alpha = 1
        })
        let tappedImageView = gestureRecognizer.view!
    }
    
    @IBAction func savePhotoButtonTapped(sender: AnyObject) {
        
        UIImageWriteToSavedPhotosAlbum(self.imageFromToday.image!, self, #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        dispatch_async(dispatch_get_main_queue(), {
            UIAlertView(title: "Success", message: "Today's picture of the day has been saved to your Camera Roll successfully", delegate: nil, cancelButtonTitle: "Close").show()
        })
    }
    
    func updateMainPhoto(pictureURL: NSURL) {
        let pictureData = NSData(contentsOfURL: pictureURL)
        imageFromToday.image = UIImage(data: pictureData!)
    }
    
    func updateTitleLabel(titleString:String) {
        titleLabel.text = "\(titleString)"
    }
    
    func updateInfoText(infoTextString:String) {
        infoTextview.text = infoTextString
        self.showTextButton.alpha = 1
        self.showTextButton.layer.borderWidth = 2
        self.showTextButton.layer.borderColor = self.showTextButton.titleLabel?.textColor.CGColor
        self.showTextButton.layer.cornerRadius = 15
        
        self.savePhotoButton.alpha = 1
        self.savePhotoButton.layer.borderWidth = 2
        self.savePhotoButton.layer.borderColor = self.showTextButton.titleLabel?.textColor.CGColor
        self.savePhotoButton.layer.cornerRadius = 15
    }

}

