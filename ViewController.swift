//
//  ViewController.swift
//  Open In Chrome Controller
//
//  Created by Avery Bentz on 2015-07-20.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myURLTextField: UITextField!
    
    @IBOutlet var savedURLLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stringKey = NSUserDefaults.standardUserDefaults()
        savedURLLabel.text = stringKey.stringForKey("savedURL")
        
        //Set URL
        //URL that will open in Chrome
        var openInChromeURL:NSURL = NSURL(string: "chromes://google.ca" + (savedURLLabel.text)!)!
        //URL that will open in Safari
        var openInSafariURL:NSURL = NSURL(string: "https://" + (savedURLLabel.text)!)!
        
        /*//Check if chrome is installed
        if(UIApplication.sharedApplication().canOpenURL(openInChromeURL)){
            UIApplication.sharedApplication().openURL(openInChromeURL)
        }
        else{
        UIApplication.sharedApplication().openURL(openInSafariURL)
        }*/
        //Open in Chrome
        UIApplication.sharedApplication().openURL(openInChromeURL)


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveURL(sender: AnyObject) {
        //Create var that will hold the URL that the user provides via myURLTextField
        let myURL = myURLTextField.text
        //Save URL to NSUserDefaults
        NSUserDefaults.standardUserDefaults().setObject(myURL, forKey: "savedURL")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }

}

