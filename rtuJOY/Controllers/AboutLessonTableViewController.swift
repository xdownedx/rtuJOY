//
//  AboutLessonTableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 15.09.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class AboutLessonTableViewController: UITableViewController {

    @IBOutlet weak var typeLessonLabel: UILabel!
    @IBOutlet weak var nameLessonLabel: UILabel!
    var cell = AboutTaskTableViewCell()
    var day:String?
    var number:Int?
    var task:task?
    var vc = AddDeadlineForLessonViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(number! + 1 ) пара"
        vc = storyboard?.instantiateViewController(identifier: "AddDeadlineForLesson") as! AddDeadlineForLessonViewController
        typeLessonLabel.text = task!.typeLesson
        nameLessonLabel.text = task!.nameLesson
        self.tableView.register(UINib(nibName: String(describing: AboutTaskTableViewCell.self), bundle: nil),forCellReuseIdentifier:String(describing: AboutTaskTableViewCell.self))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "AboutTaskTableViewCell", for: indexPath) as! AboutTaskTableViewCell
        switch indexPath.row {
        case 0:
            cell.label.text = "\(day!.lowercased()), \(task!.timeStart) - \(task!.timeEnd)"
            cell.icon?.image = UIImage(systemName: "clock")
        case 1:
            cell.label.text = task?.nameTeacher
            cell.icon?.image = UIImage(systemName: "graduationcap.fill")
        case 2:
            cell.label.text = task?.numberAudince
            cell.icon?.image = UIImage(systemName: "airplayaudio")
        default:
            return cell
        }
        return cell
    }
    
    @IBAction func addDeadlineForLesson(_ sender: Any) {
        vc.nameLessonText = task!.nameLesson
        navigationController?.pushViewController(vc, animated: true)
    }
}
