//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Dustin Koch on 5/8/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit
//1
protocol TaskTableViewCellDelegate: class {
    func toggleSettingForCell(cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDueDateLabel: UILabel!
    @IBOutlet weak var taskCompleteSquare: UIButton!
    
    //2
    weak var delegate: TaskTableViewCellDelegate?
    
    @IBAction func completeTaskButtonTapped(_ sender: UIButton) {
        //3
        delegate?.toggleSettingForCell(cell: self)
        
    }
    
    func updateCellView(task: Task) {
        if task.isComplete == true {
            taskCompleteSquare.imageView?.image = UIImage(named: "unchecked")
        } else {
            taskCompleteSquare.imageView?.image = UIImage(named: "checked")
        }
    }
    
    
}
