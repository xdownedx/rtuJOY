//
//  network.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 12.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
import UIKit

struct sheduleGroup:Decodable {
    var monday: tableTask?
    var tuesday: tableTask?
    var wednesday: tableTask?
    var thursday: tableTask?
    var friday: tableTask?
    var saturday: tableTask?
}

struct tableTask:Decodable {
    var firstTask: task?
    var secondTask: task?
    var thirdTask: task?
    var fourthTask: task?
    var fifthTask: task?
    var sixthTask: task?
    var seventhTask: task?
    var eighthTask: task?
}

struct task:Decodable {
    var timeStart:String
    var timeEnd:String
    var typeLesson:String
    var nameLesson:String
    var numberAudince:String
    var nameTeacher:String
    var addressCampus:String
}

func parsingJson(){
    let urlString="https://github.com/xdownedx/apidatabase/blob/master/test1xods"
    guard let url=URL(string: urlString) else {
        return
    }
    URLSession.shared.dataTask(with:url){data, response, error in
        
        guard let data = data else {return}
        guard error == nil else {return}
        do{
            let timeTable = try JSONDecoder().decode(sheduleGroup.self, from: data)
            print(timeTable)
        } catch let error{
            print(error)
        }
    }.resume()

}
