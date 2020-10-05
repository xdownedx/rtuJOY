//
//  VKViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 05.10.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
import WebKit
class VKViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var picError: UIStackView!
    @IBOutlet weak var labelError: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if CheckInternet.isConnectedToNetwork(){
            picError.isHidden = true
            labelError.isHidden = true
            webview.isHidden = false
            webview.load(URLRequest(url: URL(string: "https://vk.com/rtu_menshe_chem_3")!))
        }else{
            webview.isHidden = true
            picError.isHidden = false
            labelError.isHidden = false
        }
    }
}


