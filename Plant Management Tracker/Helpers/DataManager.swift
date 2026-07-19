//
//  DataManager.swift
//  Plant Management Tracker
//
//  Created by Abbey Jolliff on 17/7/2026.
//

import Foundation

//Manages saving and loading data for the application.
class DataManager {
    
    //MARK: Shared Instance
    
    //Shared instance of the DataManager used throughout the application.
    static let shared = DataManager()
    
    //Prevents other parts of the application from creating additional DataManager objects.
    private init() {
    }
    
    //Loads previously saved application data.
    //This method should be called once the application starts.
    func initialiseData() {
        
        plantCollection = loadPlants()
        taskCollection = loadTasks()
    }
    
    
    
    //MARK: Constants
    
    //Key used to store all the plant collection in UserDefaults.
    private let plantCollectionKey = "plantCollection"
    
    //Key used to store all the task collection in UserDefaults.
    private let taskCollectionKey = "taskCollection"
    
    
    //MARK: Properties
    
    //Stores all Plant objects currently created by the user.
    private(set) var plantCollection: [Plant] = []
    
    //Stores all Task objects currently created by the application.
    private(set) var taskCollection: [Task] = []
    
    
    //MARK: Plant Management Methods
    
    //Generates a unique identifier for a new Plant object.
    //Returns: The next available plant ID.
    func generatePlantID() -> Int {
        
        //If no plant exists, starts IDs at 101.
        guard !plantCollection.isEmpty
                
        else {
            return 101
        }
        
        //Find the highest existing plant ID.
        let highestPlantID = plantCollection
            .map { $0.plantID }
            .max() ?? 100
        
        //Returns the next available ID.
        return highestPlantID + 1
    }
    
    
    //Adds a new Plant object to the collection and saves the updated data.
    func addPlant(_ plant: Plant) {
        
        //Add the plant to the collection.
        plantCollection.append(plant)
        
        //Save the updated collection.
        savePlants(plantCollection)
    }
    
    
    //deletePlant()
    
    //Removes the plant with the specified plantID from the collection.
    // Parameter plantID: The unique identifier of the plant to remove.
    func deletePlant(withID plantID: Int) {
        
        //Find the position of the plant with the matching ID.
        guard let index = plantCollection.firstIndex(where: { $0.plantID == plantID})
                
        else {
            print("Plant not found.")
            return
            
        }
        
        //Remove the plant from the collection.
        plantCollection.remove(at: index)
        
        //Saves the updated collection.
        savePlants(plantCollection)
        
    }
    
    
    //MARK: Task Management Methods
    
    //Generate a unique identifier for a new Task object.
    //Returns: The next available task ID.
    func generateTaskID() -> Int {
        
        //If no tasks exist, start IDs at 201.
        guard !taskCollection.isEmpty
                
        else {
            return 201
        }
        
        //Find the highest existing task ID.
        let highestTaskID = taskCollection
            .map { $0.taskID }
            .max() ?? 200
        
        
        //Returns the next available ID.
        return highestTaskID + 1
    }
    
    
    //Adds a new Task object to the collection and saves the updated data.
    func addTask(_ task: Task) {
        
        //Add the task to the collection.
        taskCollection.append(task)
        
        //Saves the updated collection.
        saveTasks(taskCollection)
    }
    
    
    
    //MARK: Save Methods
    
    //Saves the plant collection to UserDefaults.
    func savePlants(_ plantCollection: [Plant]) {
        
        let encoder = JSONEncoder()
        
        do {
            
            let encodedData = try encoder.encode(plantCollection)
            
            UserDefaults.standard.set(encodedData, forKey: plantCollectionKey)
        }
        catch {
            
            print("Error saving plants: \(error)")
        }
    }
    
    
    //Saves the task collection to UserDefaults.
    func saveTasks(_ taskCollection: [Task]) {
        
        let encoder = JSONEncoder()
        
        do {
            let encodedData = try encoder.encode(taskCollection)
            
            UserDefaults.standard.set(encodedData, forKey: taskCollectionKey)
        }
        
        catch {
            print("Error saving tasks: \(error)")
        }
    }
    
    
    //MARK: Load Methods
    
    //Loads the plant collection from UserDefaults.
    func loadPlants() -> [Plant] {
        
        guard let savedData = UserDefaults.standard.data(forKey: plantCollectionKey)
        
        else {
            
            //No saved plants exist yet.
            return []
        }
        
        
        let decoder = JSONDecoder()
        
        do {
            
            let plantCollection = try decoder.decode([Plant].self, from: savedData)
            
            return plantCollection
        }
        
        catch {
            
            print("Error loading plants: \(error)")
            return []
        }
    }
    
    
    //Loads the task collection from UserDefaults.
    func loadTasks() -> [Task] {
        
        guard let savedData = UserDefaults.standard.data(forKey: taskCollectionKey)
                
        else {
            
            //No saved tasks exist yet.
            return []
        }
        
        let decoder = JSONDecoder()
        
        do {
            let taskCollection = try decoder.decode([Task].self, from: savedData)
            
            return taskCollection
        }
        
        catch {
            print("Error loading tasks: \(error)")
            
            return []
        }
    }
    
}
