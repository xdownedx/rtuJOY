//
//  AddDeadlineVC.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 22.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
import RealmSwift

class AddDeadlineVC: UIViewController {

    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!
    @IBAction func saveButton(_ sender: Any) {
        let taskForSave = deadlineTask(nameLesson: nameLesson.text!, deadlineTask: taskLabel.text!, deadlineTime:"", deadlineIsReady: false)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        taskForSave.deadlineTime = dateFormatter.string(from: dateDeadline.date)
        storageManager.saveObjectTask(taskForSave)
        self.navigationController?.popViewController(animated: true)

    }
    @IBOutlet weak var nameLesson: UITextField!
    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var dateDeadline: UIDatePicker!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButtonOutlet.isEnabled = false
        
    }
    @IBAction func nameLessonTF(_ sender: Any) {
        if nameLesson.text != "" && taskLabel.text != ""{
            saveButtonOutlet.isEnabled = true
        }else{
            saveButtonOutlet.isEnabled = false

        }
    }
    
    @IBAction func taskTF(_ sender: Any) {
        if nameLesson.text != "" && taskLabel.text != ""{
            saveButtonOutlet.isEnabled = true
        }else{
            saveButtonOutlet.isEnabled = false

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
