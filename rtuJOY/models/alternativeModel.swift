//
//  Data.swift
//  rtuApp
//
//  Created by Максим Лисицкий on 05.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation

//This Model For Parsing with JSONDecoder

struct globalSchedule:Decodable {
    var schedule:Array<schedule>
    var semester:semester
}
struct semester:Codable {
    var startDate:String
    var endDate:String
}
struct schedule:Codable {
    var day:Int
    var number:Int
    var interval:interval
    var info:Array<info>
}
struct interval:Codable {
    var startTime:String
    var endTime:String
}
struct info:Codable {
    var name:String
    var weeks:String
    var room:String
    var professor:String
    var type:String
}
