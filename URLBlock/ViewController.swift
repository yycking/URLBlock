//
//  ViewController.swift
//  URLBlock
//
//  Created by Wayne Yeh on 2017/1/12.
//  Copyright © 2017年 Wayne Yeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        URLBlock.delegate = self
        
        let url  = URL.init(string: "https://www.google.com")!
        webview.loadRequest(URLRequest(url: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: URLBlockDelegate {
    func canBlock(url: URL) -> Bool {
        
        return true
    }
}
