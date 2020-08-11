//
//  ChoiceGroupViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 03.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class ChoiceGroupViewController: UIViewController {
    
    @IBOutlet weak var errorTextView: UITextView!
    @IBOutlet weak var buttonToSave: UIButton!
    @IBOutlet weak var labelGroup: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goTo()
        
        errorTextView.layer.cornerRadius=20
        errorTextView.alpha=0
        buttonToSave.layer.cornerRadius=5
        buttonToSave.isEnabled=false
        buttonToSave.alpha=0.4
    }
    func goTo(){
        if GroupSettings.groupName != nil{
            performSegue(withIdentifier: "startSegue", sender: self)
        }
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
        let urlString="http://api.mirea-assistant.ru/schedule?group=\(groupID)"
        guard let url=URL(string: urlString) else {
            return
        }
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url){data, response, error in
            self.editVC(dataCountEver: data!.count, groupID: groupID)
        }
        
        task.resume()
        
    }
    
    func editVC(dataCountEver:Int,groupID:String){
        if dataCountEver>100{
            DispatchQueue.main.async(execute: {
                self.errorTextView.alpha=0
                GroupSettings.groupName=groupID
                GroupSettings.groupNameRU=transliteToRu(rus:self.labelGroup.text!)
                self.performSegue(withIdentifier: "startSegue", sender: self)
            })
        }else{
            DispatchQueue.main.async(execute: {
                self.errorTextView.alpha=1
            })
        }
    }
}

