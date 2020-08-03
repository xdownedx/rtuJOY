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
        return "практическое занятие"
    case "лк":
        return "лекция"
    case "лаб":
        return "лабораторная работа"
    case "зач":
        return "зачёт"
    case "экз":
        return "экзамен"
    default:
        return "занятие"
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
    case 2...5:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    case 1,6,7:
        arrayForReturn.append(Array<task>())
        arrayForReturn.append(Array<task>())
        return arrayForReturn
    default:
        return arrayForReturn
    }
}

func transliterate(nonLatin: String) -> String {
    return nonLatin
        .applyingTransform(.toLatin, reverse: false)?
        .applyingTransform(.stripDiacritics, reverse: false)?
        .lowercased()
        .replacingOccurrences(of: "Х", with: "x") ?? nonLatin
}
