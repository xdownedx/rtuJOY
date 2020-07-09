//
//  TableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 09.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

let rows = [2,3,1]
var idCell = -1
class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),forCellReuseIdentifier:String(describing: CustomCell.self))
    }
    
    
    
    // Получим количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard (weekday>1)&&(weekday<6) else{
            return 2}
        return 3
    }
    
    //получим количество ячеек в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section]
    }
    
    // Получим заголовок для секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard weekday>1 else {
            switch section {
            case 0:
                return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
            case 1:
                return "\(days[weekday]), \(currentData(day: curDayInMonth+2, month: curMonth))"
            default:
                return "error"
            }
            
        }
        guard weekday<6 else{
            
            switch weekday {
            case 6:
                switch section {
                case 0:
                    return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
                case 1:
                    return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
                default:
                    return "error"
                }
            case 7:
                switch section {
                case 0:
                    return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
                case 1:
                    return "\(days[0]), \(currentData(day: curDayInMonth+2, month: curMonth))"
                default:
                    return "error"
                }
            default:
                return "error"
            }
        }
    
    
    switch section {
    case 0:
    return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
    case 1:
    return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
    case 2:
    return "\(days[weekday]), \(currentData(day: curDayInMonth+2, month: curMonth))"
    default:
    return "error"
    }
    
}

//Заполнение ячеек
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    
    cell.timeStart?.text = "10:00"
    cell.nameLesson?.text = "Линейная Алгебра и АГ"
    cell.timeEnd?.text = "10:40"
    cell.typeLesson?.text = "лекция"
    cell.numberAudince?.text = "А-12"
    return cell
    
}



/*
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
 
 // Configure the cell...
 
 return cell
 }
 */

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
