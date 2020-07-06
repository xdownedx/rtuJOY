//
//  Data.swift
//  rtuApp
//
//  Created by Максим Лисицкий on 05.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation

struct QuoteDataModel : Identifiable {
    
    var id: String {
        return name
    }
    
    var name : String
    var teacher : String
    var classroom : String
    var time : String
}

struct SectionDataModel : Identifiable {
    
    var id: String {
        return letter
    }
    
    var letter : String          //День недели и число
    var quotes : [QuoteDataModel]   //вложенные ячейки
    var expanded = false
}

class UserData : ObservableObject {
    
    @Published var timetableKTCO0119 : [SectionDataModel] = [
        SectionDataModel(letter: "Понедельник", quotes: [
            QuoteDataModel(name: "Линейная Алгебра и АГ", teacher: "Cазонов А.И.", classroom: "А-173", time: "9:00"),
            QuoteDataModel(name: "Линейная Алгебра и АГ", teacher: "Cазонов А.И.", classroom: "А-173", time: "10:40"),
            QuoteDataModel(name: "Линейная Алгебра и АГ", teacher: "Cазонов А.И.", classroom: "А-12", time: "13:10"),
            QuoteDataModel(name: "Физика", teacher: "Cазонов А.И.", classroom: "B-321", time: "14:50"),
        ]),
        SectionDataModel(letter: "Вторник", quotes: [
            QuoteDataModel(name: "Физ-ра", teacher: "-", classroom: "Спортзал", time: "9:00"),
            QuoteDataModel(name: "Ин.яз", teacher: "-", classroom: "-", time: "10:40"),
            QuoteDataModel(name: "Физика лаб.", teacher: "-", classroom: "В-331", time: "13:10"),
            QuoteDataModel(name: "Программирование лк", teacher: "Парфенов Д.В.", classroom: "А-9", time: "14:50"),
            QuoteDataModel(name: "Программирование пк", teacher: "Парфенов Д.В.", classroom: "ивц-4", time: "16:30"),
            QuoteDataModel(name: "Программирование пк", teacher: "Парфенов Д.В.", classroom: "ивц-4", time: "18:10"),
        ]),
        SectionDataModel(letter: "Cреда", quotes: [
            QuoteDataModel(name: "Начерт. геометрия лк", teacher: "Бойков А.А.", classroom: "А-61 МП-1", time: "13:10"),
            QuoteDataModel(name: "Начерт. геометрия лк", teacher: "Беглов И.А.", classroom: "А-331 МП-1", time: "14:50"),
        ]),
    ]
}
