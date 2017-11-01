//
//  ViewController.swift
//  Web Browser
//
//  Created by Ashutosh Singh on 26/07/17.
//  Copyright © 2017 Ashutosh Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UIWebViewDelegate {

    @IBOutlet weak var mySearchBar: UISearchBar!
    
    @IBOutlet weak var myWebView: UIWebView!
    @IBAction func back(_ sender: Any)
    {
       if myWebView.canGoBack
       {
        myWebView.goBack()
        }
    }
    
    
    @IBAction func next(_ sender: Any)
    {
   if myWebView.canGoForward
   {
    myWebView.goForward()
        }
    }
   
    
    @IBAction func refresh(_ sender: Any)
    {
        myWebView.reload()
    }
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
      mySearchBar.resignFirstResponder()
        
        if let url = URL(string: mySearchBar.text!)
        {
            myWebView.loadRequest(URLRequest(url: url))
            
        }
        else{
            print ("ERROR")
        }
    }
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

