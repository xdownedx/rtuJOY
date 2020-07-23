//
//  SettingGroupViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 23.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class SettingGroupViewController: UIViewController {

    @IBOutlet weak var buttonToSave: UIButton!
    @IBOutlet weak var labelGroup: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonToSave.layer.cornerRadius=5
        buttonToSave.isEnabled=false
        buttonToSave.alpha=0.4
    }
    

    @IBAction func edingTF(_ sender: Any) {
        if labelGroup.text==""{
            buttonToSave.isEnabled=false
            buttonToSave.alpha=0.4
        }else{
            buttonToSave.isEnabled = true
            buttonToSave.alpha=1
        }
    }
//
    
    
    
    @IBAction func buttonToSavePressed(_ sender: Any) {
        labelGroup.text=""
        self.tabBarController?.selectedIndex=0
    }
}
