//
//  ViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 06.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.timeStart?.text = "10:00"
        cell.nameLesson?.text = "Линейная Алгебра и АГ"
        cell.timeEnd.text? = "timeEnd"
        cell.typeLesson?.text = "лекция"
        cell.numberAudince?.text = "А-12"
        return cell
    }
    
}
