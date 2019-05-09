//
//  TaskListTableViewController.swift
//  TaskManager
//
//  Created by Dustin Koch on 5/8/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }


    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tasks"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        let task = TaskController.shared.tasks[indexPath.row]
        cell.taskNameLabel.text = task.name
        cell.taskDueDateLabel.text = task.due?.stringValue()
        cell.taskCompleteSquare.titleLabel?.text = ""
        if task.isComplete == true {
            cell.taskCompleteSquare.setImage(UIImage(named:"checked"), for: .normal)
            } else {
            cell.taskCompleteSquare.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        cell.delegate = self
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.deleteTask(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        if segue.identifier == "toTaskDetailView" {
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            let destinationVC = segue.destination as? TaskDetailTableViewController
            let task = TaskController.shared.tasks[index]
            destinationVC?.task = task
        }
    }
} //end of class

extension TaskListTableViewController: TaskTableViewCellDelegate {
    func toggleSettingForCell(cell: TaskTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let task = TaskController.shared.tasks[indexPath.row]
        TaskController.shared.changeBool(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        TaskController.shared.saveToPersistence()
        
    }
    
    
}
