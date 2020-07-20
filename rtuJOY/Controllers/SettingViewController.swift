//
//  SettingViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 20.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func numberOfSections(in settingTableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ settingTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
