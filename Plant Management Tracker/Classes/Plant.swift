//
//  Plant.swift
//  Plant Management Tracker
//
//  Created by Abbey Jolliff on 17/7/2026.
//

import Foundation


//Represents a single plant profile created by the user.

class Plant: Codable {
    
    //MARK: Properties
    
    
    //Unique identifier assigned to the plant.
    var plantID: Int
    
    
    //Stores the plant name entered by the user.
    var plantName: String
    
    
    //Stores whether the plant is an indoor or outdoor plant.
    var plantType: String
    
    
    //Stores the watering frequency in days.
    var wateringFrequency: Int
    
    
    //Stores the fertilising frequency in months.
    var fertilisingFrequency: Int
    
    
    //Stores the selected sunlight requirements.
    var sunlightRequirement: String
    
    
    //Stores any notes entered by the user.
    var plantNotes: String
    
    
    //Stores whether watering reminders are enabled.
    var wateringReminderEnabled: Bool
    
    
    //Stores whether fertilising reminders are enabled.
    var fertilisingReminderEnabled: Bool
    
    
    //Stores the plant image selected by the user as binary data.
    var plantImage: Data
    
    
    //MARK: Initialiser
    
    //Creates a new Plant object using the information entered by the user.
    init(plantID: Int, plantName: String, plantType: String, wateringFrequency: Int, fertilisingFrequency: Int, sunlightRequirement: String, plantNotes: String, wateringReminderEnabled: Bool, fertilisingReminderEnabled: Bool, plantImage: Data) {
        
        self.plantID = plantID
        self.plantName = plantName
        self.plantType = plantType
        self.wateringFrequency = wateringFrequency
        self.fertilisingFrequency = fertilisingFrequency
        self.sunlightRequirement = sunlightRequirement
        self.plantNotes = plantNotes
        self.wateringReminderEnabled = wateringReminderEnabled
        self.fertilisingReminderEnabled = fertilisingReminderEnabled
        self.plantImage = plantImage
    }
    
    //MARK: Methods
    
    
    
    
    
}
