//
//  SettingGroupViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 23.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class SettingGroupViewController: UIViewController {

    @IBOutlet weak var errorTextView: UITextView!
    @IBOutlet weak var buttonToSave: UIButton!
    @IBOutlet weak var labelGroup: UITextField!
    let parsingData=ParsingData()
    let tableTestController=TableViewController()
    func checkGroup(group: String){
             let urlString="http://api.mirea-assistant.ru/schedule?group=\(group)"
             guard let url=URL(string: urlString) else {
                self.errorTextView.alpha=1
                return
             }
             let session=URLSession(configuration: .default)
             let task = session.dataTask(with: url){data, response, error in
                 if let data=data{
                    if  data.count > 100{
                        DispatchQueue.main.async(execute: {
                            self.errorTextView.alpha=0

                        })
                    }else{
                        DispatchQueue.main.async(execute: {
                            self.errorTextView.alpha=1
                        
                        })
                    }
                 }
             }
             task.resume()
             return
         }
       
    func transliterate(nonLatin: String) -> String {
        return nonLatin
            .applyingTransform(.toLatin, reverse: false)?
            .applyingTransform(.stripDiacritics, reverse: false)?
            .lowercased()
            .replacingOccurrences(of: "Х", with: "x") ?? nonLatin
    }
    
    
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
//
    
    
    
    @IBAction func buttonToSavePressed(_ sender: Any) {
        let groupID=transliterate(nonLatin: labelGroup.text!)
        checkGroup(group: groupID)
        if errorTextView.alpha==0{
            currentGroup=groupID
            DispatchQueue.main.async(execute: {
                self.tabBarController?.selectedIndex=1
                self.tabBarController?.selectedIndex=0
                
            })
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
