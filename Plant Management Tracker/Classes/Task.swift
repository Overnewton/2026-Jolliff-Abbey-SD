//
//  Task.swift
//  Plant Management Tracker
//
//  Created by Abbey Jolliff on 17/7/2026.
//

import Foundation

//Represents one recurring plant care task.

class Task: Codable {
    
    //MARK: Properties
    
    
    //Unique identifier for the task.
    var taskID: Int
    
    //The plant associated with this task.
    var taskPlantID: Int
    
    //The type of task (Watering or Fertilising).
    var taskType: String
    
    //The next due date for the task.
    var taskDueDate: Date
    
    //Indicated whether the task has been completed.
    var taskCompleted: Bool
    
    //Number of days between recurring tasks.
    var taskFrequency: Int
    
    //The date the task was last completed.
    var lastCompletedDate: Date
    
    
    
    //MARK: Initialiser
    
    init(taskID: Int, taskPlantID: Int, taskType: String, taskDueDate: Date, taskCompleted: Bool, taskFrequency: Int, lastCompletedDate: Date) {
        
        self.taskID = taskID
        self.taskPlantID = taskPlantID
        self.taskType = taskType
        self.taskDueDate = taskDueDate
        self.taskCompleted = taskCompleted
        self.taskFrequency = taskFrequency
        self.lastCompletedDate = lastCompletedDate
    }
}
