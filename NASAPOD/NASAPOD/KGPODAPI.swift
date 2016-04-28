//
//  KGPODAPI.swift
//  NASAPOD
//
//  Created by Kayla Galway on 4/27/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

//And then you access it like this
//ForesquareAPIClientConstants.baseURLString

import Foundation

struct ForesquareAPIClientConstants {
    static let baseURLString = "https://api.nasa.gov/planetary/apod?api_key="
    static let keyString = "c5Q1SgpX8R0PvMNuzg1GwnBUnU93F5SJpB6z0yB2"
}


func getPicture(completionClosure: (pictureDict:NSDictionary) ->()) {
    
    let pictureURLString: String = "https://api.nasa.gov/planetary/apod?api_key=c5Q1SgpX8R0PvMNuzg1GwnBUnU93F5SJpB6z0yB2"
    let session = NSURLSession.sharedSession()
    let url = NSURL(string: pictureURLString)!
    
    session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        // Make sure we get an OK response
        guard let realResponse = response as? NSHTTPURLResponse where
            realResponse.statusCode == 200 else {
                print("Not a 200 response")
                return
        }
        do {
            if let pictureDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                completionClosure(pictureDict: pictureDictionary)
            }
        } catch let error {
            print(error)
        }
    }).resume()
}