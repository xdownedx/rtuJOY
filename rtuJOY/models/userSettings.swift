//
//  userSettings.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 03.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
//save groupName in phoneMemory
final class GroupSettings{
    
    private enum SettingKey:String{
        case groupName
        case groupNameRU
    }
    
    static var groupName: String! {
        get{
            return UserDefaults.standard.string(forKey: SettingKey.groupName.rawValue)
        }
        set{
            let defaults = UserDefaults.standard
            let key = SettingKey.groupName.rawValue
            if let name = newValue{
                defaults.set(name, forKey: key)
            }
        }
    }
    
    static var groupNameRU: String! {
        get{
            return UserDefaults.standard.string(forKey: SettingKey.groupNameRU.rawValue)
        }
        set{
            let defaults = UserDefaults.standard
            let key = SettingKey.groupNameRU.rawValue
            if let name = newValue{
                defaults.set(name, forKey: key)
            }
        }
    }
    
    
}
