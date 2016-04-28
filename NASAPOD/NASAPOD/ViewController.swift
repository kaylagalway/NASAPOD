//
//  ViewController.swift
//  NASAPOD
//
//  Created by Kayla Galway on 4/27/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageFromToday: UIImageView!
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextview: UITextView!
    @IBOutlet weak var viewFullImageButton: UIButton!
    @IBOutlet weak var podLabel: UILabel!
    
    @IBOutlet weak var showTextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFullImageButton.alpha = 0
        self.showTextButton.alpha = 0
        
        
        
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


    @IBAction func viewFullImageTapped(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: {
            self.bannerLabel.alpha = 0
            self.titleLabel.alpha = 0
            self.infoTextview.alpha = 0
            self.podLabel.alpha = 0
            self.viewFullImageButton.alpha = 0
//            self.showTextButton.layer.borderWidth = 3
//            self.showTextButton.layer.borderColor = self.showTextButton.titleLabel?.textColor.CGColor
//            self.showTextButton.layer.cornerRadius = 15
            self.showTextButton.alpha = 1
        })
    }
    @IBAction func showTextButtonTapped(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: {
        self.bannerLabel.alpha = 1
        self.titleLabel.alpha = 1
        self.infoTextview.alpha = 1
        self.podLabel.alpha = 1
        self.viewFullImageButton.alpha = 1
        self.showTextButton.alpha = 0
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
        self.viewFullImageButton.alpha = 1
//        infoTextview.layer.borderColor = UIColor.grayColor().CGColor
//        infoTextview.layer.borderWidth = 2
//        infoTextview.layer.cornerRadius = 3.0
    }
    
    
    //        var url:NSURL = NSURL.URLWithString("http://myURL/ios8.png")
    //        var data:NSData = NSData.dataWithContentsOfURL(url, options: nil, error: nil)
    //
    //        imageView.image = UIImage.imageWithData(data)// Error here
    //        Try this imageURL.image = UIImage(data: myDataVar)
    /*
 func updateIPLabel(text: String) {
 self.ipLabel.text = "Your IP is " + text
 }
 
 func updatePostLabel(text: String) {
 self.postResultLabel.text = "POST : " + text
 }*/
}

