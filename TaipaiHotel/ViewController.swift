//
//  ViewController.swift
//  TaipaiHotel
//
//  Created by Mrosstro on 2017/6/12.
//  Copyright © 2017年 Mrosstro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hotelName:String = ""
    var hotelAddr:String = ""
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = hotelName
        
        let address:String = "http://maps.google.com/maps?hl=zh-TW&q=" + hotelAddr as! String
        let url:URL = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        let request = URLRequest(url: url)
        
        webView!.loadRequest(request)
        
    }
    
}

