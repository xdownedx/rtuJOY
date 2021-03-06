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
        return "семинар"
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

func transliteToRu(rus: String) -> String {
    return rus
        .uppercased()
        .replacingOccurrences(of: " ", with: "-")
}

func transliteToEng(russian:String) -> String {
    var english = ""
    let dictionary: [Character:String] = ["a":"a",
                                          "б":"b",
                                          "в":"v",
                                          "г":"g",
                                          "д":"d",
                                          "е":"e",
                                          "ё":"e",
                                          "ж":"zh",
                                          "з":"z",
                                          "и":"i",
                                          "й":"i",
                                          "л":"l",
                                          "к":"k",
                                          "м":"m",
                                          "н":"n",
                                          "о":"o",
                                          "п":"p",
                                          "р":"r",
                                          "с":"s",
                                          "т":"t",
                                          "у":"u",
                                          "ф":"f",
                                          "х":"x",
                                          "ц":"c",
                                          "ч":"ch",
                                          "ш":"sh",
                                          "э":"e%60",
                                          "ю":"yu",
                                          "я":"ya",
                                          "-":"-",
                                          " ":"-"
    ]
    for char in russian {
        english.append(dictionary[char] ?? String(char))
    }
    return english
}

