//
//  ViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 06.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
var dada = 1
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dada
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.timeStart?.text = "10:00"
        cell.nameLesson?.text = "Линейная Алгебра и АГ"
        cell.timeEnd?.text = "10:40"
        cell.typeLesson?.text = "лекция"
        cell.numberAudince?.text = "А-12"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
    
    
}
