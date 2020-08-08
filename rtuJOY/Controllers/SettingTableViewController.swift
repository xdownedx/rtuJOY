//
//  SettingTableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 21.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var cell = settingCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = GroupSettings.groupNameRU!
        self.tableView.register(UINib(nibName: String(describing: settingCell.self), bundle: nil),forCellReuseIdentifier:String(describing: settingCell.self))
        
    }
    
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! settingCell
        switch indexPath.row {
        case 0:
            cell.label.text = "Сменить группу"
        case 1:
            cell.label.text = "Уведомления"
            cell.imageOfCell?.image = UIImage(systemName: "bell.fill")
        case 2:
            cell.label.text = "Условия использования"
            cell.imageOfCell?.image = UIImage(systemName: "info.circle")
        case 3:
            cell.label.text = "Связаться с нами"
            cell.imageOfCell?.image = UIImage(named: "vk")
        default:
            return cell
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "groupChangeVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            return
        }
    }
    
}
