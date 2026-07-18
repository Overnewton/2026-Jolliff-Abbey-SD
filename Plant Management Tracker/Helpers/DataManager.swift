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
        
        //Load any previously saved plants when the application starts.
        plantCollection = loadPlants()
        
    }
    
    
    
    //MARK: Constants
    
    //Key used to store all the plant collection in UserDefaults.
    private let plantCollectionKey = "plantCollection"
    
    
    //MARK: Properties
    
    //Stores all Plant objects currently created by the user.
    private(set) var plantCollection: [Plant]
    
    
    //MARK: Plant Management Methods
    //deletePlant()
    
    //Removes the plant with the specified plantID from the collection.
    // Parameter plantID: The unique dentifier of the plant to remove.
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
    
    
    //MARK: Save Methods
    
    //Adds a new Plant object to the collection and saves the updated data.
    func addPlant(_ plant: Plant) {
        
        //Add the plant to the collection.
        plantCollection.append(plant)
        
        //Save the updated collection.
        savePlants(plantCollection)
    }
    
    
    
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
    
}
