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
    let parsingData=ParsingData()
    let tableTestController=TableViewController()
    var test=false
    var onCompletion: ((Bool)->Void)?

    func checkGroup(group: String){
        let urlString="http://api.mirea-assistant.ru/schedule?group=\(group)"
        var jopa=false
        guard let url=URL(string: urlString) else {
            return
        }
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url){data, response, error in
                if  data!.count > 100{
                    jopa=true
                }
                self.onCompletion?(jopa)
        }
        DispatchQueue.main.async(execute: {
            task.resume()
        })
        
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
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
                swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
                self.view.addGestureRecognizer(swipeDown)
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
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    @objc func hideKeyboardOnSwipeDown() {
            view.endEditing(true)
        }
    func checkBool(bool:Bool){
        test=bool
    }
    @IBAction func buttonToSavePressed(_ sender: Any) {
        let groupID=transliterate(nonLatin: labelGroup.text!)
        DispatchQueue.main.async(execute: {
            self.onCompletion = {jopa in
                self.checkBool(bool: jopa)
            }
        })
        checkGroup(group: groupID)
        if test{
            self.errorTextView.alpha=0
            currentGroup=groupID
            self.navigationController?.popViewController(animated: true)
        }else{
            self.errorTextView.alpha=1
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
