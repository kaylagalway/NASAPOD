//: Playground - noun: a place where people can play

import UIKit

func getPicture() {
    
    // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
    let pictureURLString: String = "https://api.nasa.gov/planetary/apod?api_key=c5Q1SgpX8R0PvMNuzg1GwnBUnU93F5SJpB6z0yB2"
    let session = NSURLSession.sharedSession()
    let url = NSURL(string: pictureURLString)!
    
    // Make the POST call and handle it in a completion handler
    session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        // Make sure we get an OK response
        guard let realResponse = response as? NSHTTPURLResponse where
            realResponse.statusCode == 200 else {
                print("Not a 200 response")
                return
        }
        
        // Read the JSON
        do {
            if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                // Print what we got from the call
                print(ipString)
                
                // Parse the JSON to get the IP
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                print(jsonDictionary)
                
//                let origin = jsonDictionary["origin"] as! String
                
//                // Update the label
//                self.performSelectorOnMainThread("updateIPLabel:", withObject: origin, waitUntilDone: false)
            }
        } catch {
            print("bad things happened")
        }
    }).resume()
}