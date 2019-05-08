//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Dustin Koch on 5/8/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDueDateLabel: UILabel!
    @IBOutlet weak var taskCompleteSquare: UIButton!
    
    @IBAction func completeTaskButtonTapped(_ sender: UIButton) {
        
    }
    
    
}
