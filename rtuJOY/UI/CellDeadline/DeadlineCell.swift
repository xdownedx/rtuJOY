//
//  DeadlineCell.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 21.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit
import RealmSwift

class DeadlineCell: UITableViewCell {

    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var nameLesson: UILabel!
    @IBOutlet weak var deadlineTask: UILabel!
    @IBOutlet weak var deadlineTime: UILabel!
    var task: deadlineTask!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func didTap(_ checkBox: BEMCheckBox){
        checkBox.on = true
    }
    @IBAction func checkBoxTapped(_ sender: Any) {
        if checkBox.on{
            let realm = try! Realm()
            try! realm.write {
                task.deadlineIsReady = true
            }
        }else{
            let realm = try! Realm()
            try! realm.write {
                task.deadlineIsReady = false
            }
        }
    }
}
