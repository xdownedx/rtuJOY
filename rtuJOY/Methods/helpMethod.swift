//
//  helpMethod.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 25.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation

func disclosure(closureName:String) -> String {
    switch closureName {
    case "пр":
        return "практика"
    case "лк":
        return "лекция"
    case "лаб":
        return "лабораторная работа"
    case "зач":
        return "зачёт"
    case "экз":
        return "экзамен"
    default:
        return "занятике"
    }
}

func today()->Int{
    switch weekday {
    case 1:
        return 0
    default:
        return weekday-2
    }
}

func quanity()->Array<Array<task>>{
    var arrayForReturn:Array<Array<task>> = []
    switch weekday {
    case 1:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 2:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 3:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 4:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 5:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 6:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 7:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    default:
        return arrayForReturn
    }
}
