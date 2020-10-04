//
//  SchemaViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 02.10.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
import WebKit
class SchemaViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var picError: UIStackView!
    @IBOutlet weak var labelError: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if CheckInternet.isConnectedToNetwork(){
            picError.isHidden = true
            labelError.isHidden = true
            webview.isHidden = false
            webview.load(URLRequest(url: URL(string: "http://botpage.ru/map/")!))
        }else{
            webview.isHidden = true
            picError.isHidden = false
            labelError.isHidden = false
        }
    }
}
