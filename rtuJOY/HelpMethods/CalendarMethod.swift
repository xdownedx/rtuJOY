//
//  CalendarMethod.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 12.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
import UIKit

let days = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
let monthTable = ["Января","Февраля","Марта","Апреля","Мая","Июня","Июля","Августа","Сентября","Октября","Ноября","Декабря"]
let date = Date()
let calendar = Calendar.current
var weekday = calendar.component(.weekday, from: date)
var curDayInMonth = calendar.component(.day, from: date)
var curMonth = calendar.component(.month, from: date)
var curYear = calendar.component(.year, from: date)
var currentWeek = calendar.component(.weekOfYear, from: date)
func currentData(day: Int, month: Int)->String {
    var currentDay=day
    switch curMonth {
    case 1, 3, 5, 7, 8, 10:
        if currentDay==32{
            currentDay=1
            return "\(currentDay) \(monthTable[curMonth])"}
        else if (currentDay==33){
            currentDay=2
            return"\(currentDay) \(monthTable[curMonth])"
        }
        
    case 4,6,9,11:
        if currentDay==31{
            currentDay=1
            return "\(currentDay) \(monthTable[curMonth])"
        }else if currentDay==32{
            currentDay=2
            return "\(currentDay) \(monthTable[curMonth])"
        }
    case 2:
        if curYear%4==0{
            if currentDay==30{
                currentDay=1
                return "\(currentDay) \(monthTable[curMonth])"
            }else if currentDay==31{
                currentDay=2
                return "\(currentDay) \(monthTable[curMonth])"
            }
        } else {
            if currentDay==29{
                currentDay=1
                return "\(currentDay) \(monthTable[curMonth])"
            }else if currentDay==30{
                currentDay=2
                return"\(currentDay) \(monthTable[curMonth])"
            }
        }
    case 12:
        if currentDay==32{
            currentDay=1
            return"\(currentDay) \(monthTable[1])"}
        else if (currentDay==33){
            currentDay=2
            return "\(currentDay) \(monthTable[1])"
        }
        default:
            return "\(currentDay) \(monthTable[curMonth])"
        }
        return "\(currentDay) \(monthTable[curMonth-1])"
    }




func currentSemesterWeek(date:String)->Int{
    let updateDate=date
    print(date)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    guard let someDateTime = formatter.date(from: updateDate) else { return 1 }
    let startWeekInYear = calendar.component(.weekOfYear, from: someDateTime)
    return (currentWeek-startWeekInYear+1)
}
