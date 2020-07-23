//
//  SettingViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 20.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
   
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var labelOfInstitut: UILabel!
    @IBOutlet weak var labelOfGroup: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.layer.cornerRadius = 20
        
    }
    
    
  
}
