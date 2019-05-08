//
//  TaskController.swift
//  TaskManager
//
//  Created by Dustin Koch on 5/8/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    static let shared = TaskController()
    
    var tasks: [Task] {
       let moc = CoreDataStack.context
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let results = try? moc.fetch(request)
        return results ?? []
    }
    
    //MARK: - CRUD Functions
    
    func createTask(name: String, due: Date, notes: String) {
        let task = Task(name: name, notes: notes, due: due)
        saveToPersistence()
    
    }
    
    func deleteTask(task: Task) {
        let moc = CoreDataStack.context
        moc.delete(task)
        saveToPersistence()
    }
    
    func changeBool(task: Task){
        task.isComplete = !task.isComplete
        saveToPersistence()
    }
    
    func saveToPersistence() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch  {
            print("Error saving to persistence: \(error)")
        }
    
    }


    
}
