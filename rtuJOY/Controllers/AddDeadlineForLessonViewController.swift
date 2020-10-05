//
//  AddDeadlineForLessonViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 15.09.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class AddDeadlineForLessonViewController: UIViewController {
    
    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!
    @IBAction func saveButton(_ sender: Any) {
        let taskForSave = deadlineTask(nameLesson: nameLesson.text!, deadlineTask: taskLabel.text!, deadlineTime:"", deadlineIsReady: false)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        taskForSave.deadlineTime = dateFormatter.string(from: dateDeadline.date)
        storageManager.saveObjectTask(taskForSave)
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBOutlet weak var nameLesson: UILabel!
    
    @IBOutlet weak var dateDeadline: UIDatePicker!
    
    @IBOutlet weak var taskLabel: UITextField!
    
    
    var nameLessonText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLesson.text = nameLessonText!
        saveButtonOutlet.isEnabled = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGesture() {
        taskLabel.resignFirstResponder()
       }
    
    @IBAction func taskTF(_ sender: Any) {
        if taskLabel.text != ""{
            saveButtonOutlet.isEnabled = true
        }else{
            saveButtonOutlet.isEnabled = false
            
        }
    }
}
