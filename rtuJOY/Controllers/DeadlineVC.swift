//
//  DeadlineVC.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 19.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
import RealmSwift

class DeadlineVC: UITableViewController {
    
    @IBOutlet weak var deadlinePic: UIImageView!
    @IBOutlet weak var deadLineTV: UITextView!
    
    
    var cell = DeadlineCell()
    let realm = try! Realm()
    var taskArray: Results<deadlineTask>!
    override func viewDidLoad() {
        
        
        taskArray=realm.objects(deadlineTask.self)
        
        
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: String(describing: DeadlineCell.self), bundle: nil),forCellReuseIdentifier:String(describing: DeadlineCell.self))
        
    }
    
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        taskArray=realm.objects(deadlineTask.self)
        for task in taskArray{
            if task.deadlineIsReady{
                storageManager.deleteObjectTak(task)
            }
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if taskArray.count == 0{
            deadlinePic.frame.size.height = 206
            deadLineTV.frame.size.height = 44
            deadLineTV.isHidden = false
            deadlinePic.isHidden = false
        }else{
            deadlinePic.frame.size.height = 0
            deadLineTV.frame.size.height = 0
            deadLineTV.isHidden = true
            deadlinePic.isHidden = true
        }
        
        return taskArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "DeadlineCell", for: indexPath) as! DeadlineCell
        
        cell.checkBox.on=taskArray[indexPath.row].deadlineIsReady
        cell.deadlineTask.text = taskArray[indexPath.row].deadlineTask
        cell.deadlineTime.text = taskArray[indexPath.row].deadlineTime
        cell.nameLesson.text = taskArray[indexPath.row].nameLesson
        cell.task = taskArray[indexPath.row]
        return cell
    }
}
