//
//  network.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 12.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
import UIKit

var gg="KOLK"
func parsingJson(){
    let urlString="https://raw.githubusercontent.com/xdownedx/apidatabase/master/jojo321"
    guard let url=URL(string: urlString) else {
        return
    }
    URLSession.shared.dataTask(with:url){data, response, error in
        
        guard let data = data else {return}
        guard error == nil else {return}
        do{
            let timeTable = try JSONDecoder().decode(sheduleGroup.self, from: data)
            print(timeTable.tuesday!.firstTask!.nameLesson)
            gg=timeTable.tuesday!.firstTask!.nameLesson
        } catch let error{
            print(error)
        }
    }.resume()

}
