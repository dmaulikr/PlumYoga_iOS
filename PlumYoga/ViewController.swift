//
//  ViewController.swift
//  PlumYoga
//
//  Created by me on 8/10/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let url = "http://www.plumyogadallas.com/"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
               
        if let navTextColor: NSDictionary = [NSForegroundColorAttributeName:UIColor.purpleColor()] {
            
        
        self.navigationController?.navigationBar.titleTextAttributes = navTextColor as? [String: AnyObject]
        
        }
        
        
        view?.backgroundColor = UIColor(red: 240, green: 244, blue: 245, alpha: 255)
        
        [UIView .setAnimationsEnabled(false)]
        
        
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        
       
        webView.loadRequest(request)
        webView.scrollView.bounces = false
        webView.delegate = self
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
               activityIndicator.startAnimating()
    }
    
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
       
        
        activityIndicator.stopAnimating()
        
       
        
        let currentUrl : NSString = (webView.request?.URL?.absoluteString)!
        
        print("\(currentUrl)")
        
       
        if ( currentUrl == url) {
        
        backButton.title = ""
        
        
        } else {
            
        backButton.title = "back"
            
        }
        
        
        
               
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func back(sender: UIBarButtonItem) {
        
        if webView.canGoBack {
            webView.goBack()
        }
        
        
        
    }
    @IBAction func callPlum(sender: AnyObject) {
        
         UIApplication.sharedApplication().openURL(NSURL(string:"telprompt:2147929918")!)
    }
    
}
