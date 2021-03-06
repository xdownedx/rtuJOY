//
//  TableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 09.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
import RealmSwift

var week = 1

class TableViewController: UITableViewController {
    
    var parsingData = ParsingData()
    var cell = CustomCell()
    
    var arrForConclusion:Array<Array<task>> = []
    var vc = AboutLessonTableViewController()
    
    @IBOutlet weak var viewForImage: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var sheduleNotFoundMajor: UILabel!
    @IBOutlet weak var sheduleNotFoundSecondary: UILabel!
    
    override func viewDidLoad() {
        vc = storyboard?.instantiateViewController(identifier: "AboutLessonInfo") as! AboutLessonTableViewController
        
        let realm = try! Realm()
        let scheduleTemp: Results<scheduleDatabase>! = realm.objects(scheduleDatabase.self)
        
        let group=GroupSettings.groupName
        if CheckInternet.isConnectedToNetwork(){
            self.parsingData.onCompletion = {scheduleForWeek in
                self.schedeleForConclusion(schudele: scheduleForWeek)
            }
        }else{
            
            let scheduleForTable=(parsingData.parseJSON(with: scheduleTemp[0].schedule))!
            self.schedeleForConclusion(schudele: scheduleForTable)
            
        }
        
        self.parsingData.broadcastData(group: group!)
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),forCellReuseIdentifier:String(describing: CustomCell.self))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    // Получим количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        var idConclusion=0
        var countArray = arrForConclusion.count
        while idConclusion<arrForConclusion.count{
            if arrForConclusion[idConclusion].isEmpty{countArray-=1}
            idConclusion+=1
        }
        return arrForConclusion.count
    }
    
    
    
    //получим количество ячеек в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrForConclusion.isEmpty{
            viewForImage.frame.size.height=446 //размер ячейки
            image.isHidden=false
            sheduleNotFoundMajor.isHidden=false
            sheduleNotFoundSecondary.isHidden=false
        }else{
            viewForImage.frame.size.height=0
            image.isHidden=true
            sheduleNotFoundMajor.isHidden=true
            sheduleNotFoundSecondary.isHidden=true
        }
        guard arrForConclusion[section].isEmpty==false else {
            return 0
        }
        return arrForConclusion[section].count
    }
    
    
    
    
    // Получим заголовок для секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard weekday>1 else {
            switch section {
            case 0:
                if arrForConclusion[section].isEmpty{
                    return nil
                }else{
                    return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
                }
            case 1:
                if arrForConclusion[section].isEmpty{
                    return nil
                }else{
                    return "\(days[weekday]), \(currentData(day: curDayInMonth+2, month: curMonth))"
                }
            default:
                return "error"
            }
            
        }
        guard weekday<6 else{
            
            switch weekday {
            case 6:
                switch section {
                case 0:
                    if arrForConclusion[section].isEmpty{
                        return nil
                    }else{
                        return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
                    }
                case 1:
                    if arrForConclusion[section].isEmpty{
                        return nil
                    }else{
                        return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
                    }
                default:
                    return "error"
                }
            case 7:
                switch section {
                case 0:
                    if arrForConclusion[section].isEmpty{
                        return nil
                    }else{
                        return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
                    }
                case 1:
                    if arrForConclusion[section].isEmpty{
                        return nil
                    }else{
                        return "\(days[0]), \(currentData(day: curDayInMonth+2, month: curMonth))"
                    }
                default:
                    return "error"
                }
            default:
                return "error"
            }
        }
        
        
        switch section {
        case 0:
            if arrForConclusion[section].isEmpty{
                return ""
            }else{
                return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
            }
        case 1:
            if arrForConclusion[section].isEmpty{
                return ""
            }else{
                return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
            }
        case 2:
            if arrForConclusion[section].isEmpty{
                return ""
            }else{
                return "\(days[weekday]), \(currentData(day: curDayInMonth+2, month: curMonth))"
            }
        default:
            return "error"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        vc.task = arrForConclusion[indexPath.section][indexPath.row]
        vc.number = indexPath.row
        vc.day = tableView.headerView(forSection: indexPath.section)?.textLabel?.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //Заполнение ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.timeStart?.text = arrForConclusion[indexPath.section][indexPath.row].timeStart
        cell.nameLesson?.text = arrForConclusion[indexPath.section][indexPath.row].nameLesson
        cell.timeEnd?.text = arrForConclusion[indexPath.section][indexPath.row].timeEnd
        cell.typeLesson?.text = arrForConclusion[indexPath.section][indexPath.row].typeLesson
        cell.numberAudince?.text = arrForConclusion[indexPath.section][indexPath.row].numberAudince
        cell.nameTeacher?.text = arrForConclusion[indexPath.section][indexPath.row].nameTeacher
        if cell.nameTeacher?.text == ""{
            cell.nameTeacher.isHidden=true
        }else{
            cell.nameTeacher.isHidden=false
        }
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(arrForConclusion[section].isEmpty){
            return 0.0
        }else{
            return 25.0
        }
    }
    
    func schedeleForConclusion(schudele:schedulePerWeek){
        week=currentSemesterWeek(date: schudele.startSemester)
        guard week<17 else{
            return
        }
        arrForConclusion=quanity()
        var i=0
        var j = 0
        var k = 0
        switch weekday {
        case 2...6:
            while i<arrForConclusion.count
            {
                j = 0
                k = 0
                while j < schudele.day[today()+i].count{
                    if schudele.day[today()+i][j].week.contains(week){
                        arrForConclusion[i].append(task())
                        arrForConclusion[i][k]=schudele.day[today()+i][j]
                        k+=1
                    }
                    j+=1
                }
                arrForConclusion[i].sort{$0.number < $1.number}
                i+=1
            }
        case 1:
            week+=1
            while i<arrForConclusion.count
            {
                j = 0
                k = 0
                while j < schudele.day[today()+i].count{
                    if schudele.day[today()+i][j].week.contains(week){
                        arrForConclusion[i].append(task())
                        arrForConclusion[i][k]=schudele.day[today()+i][j]
                        k+=1
                    }
                    j+=1
                }
                arrForConclusion[i].sort{$0.number < $1.number}
                i+=1
            }
        default:
            while j < schudele.day[5].count{
                if schudele.day[5][j].week.contains(week){
                    arrForConclusion[0].append(task())
                    arrForConclusion[0][k]=schudele.day[5][j]
                    k+=1
                }
                j+=1
            }
            arrForConclusion[0].sort{$0.number < $1.number}
            j = 0
            k = 0
            while j < schudele.day[0].count{
                if schudele.day[0][j].week.contains(week+1){
                    arrForConclusion[1].append(task())
                    arrForConclusion[1][k]=schudele.day[0][j]
                    k+=1
                }
                j+=1
            }
            arrForConclusion[1].sort{$0.number < $1.number}
            
        }
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
        
    }
}

