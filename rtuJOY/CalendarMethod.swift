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

func currentMonth(let month:Int) -> String{
    return monthTable[month]
}
