//
//  SettingGroupViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 23.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class SettingGroupViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var errorTextView: UITextView!
    @IBOutlet weak var buttonToSave: UIButton!
    @IBOutlet weak var labelGroup: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorTextView.layer.cornerRadius=20
        errorTextView.alpha=0
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
    
    
    @IBAction func buttonToSavePressed(_ sender: Any) {
        let groupID=transliteToEng(russian: labelGroup.text!)
        if checkGroup(group: groupID){
            self.errorTextView.alpha=0
            GroupSettings.groupName=groupID
            GroupSettings.groupNameRU=transliteToRu(rus:labelGroup.text!)
            self.navigationController?.popViewController(animated: true)
        }else{
            self.errorTextView.alpha=1
        }
    }
}
