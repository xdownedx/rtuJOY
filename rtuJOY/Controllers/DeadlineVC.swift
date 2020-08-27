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
        

        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
        let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
