//
//  AddPlantViewController.swift
//  Plant Management Tracker
//
//  Created by Abbey Jolliff on 17/7/2026.
//

import UIKit

class AddPlantViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Outlets
    
    
    //Displays the selected plant image.
    @IBOutlet weak var plantImageView: UIImageView!
    
    //Stores the plant name entered by the user.
    @IBOutlet weak var txtPlantName: UITextField!
    
    //Allows the user to select whether the plant is indoor or outdoor.
    @IBOutlet weak var segPlantType: UISegmentedControl!
    
    //Allows the user to select the sunlight requirements
    @IBOutlet weak var segSunlightRequirement: UISegmentedControl!
    
    //Stores the watering frequency entered by the user.
    @IBOutlet weak var txtWateringFrequency: UITextField!
    
    //Stores the fertilising frequency entered by the user.
    @IBOutlet weak var txtFertilisingFrequency: UITextField!
    
    //Enables or disables watering reminders.
    @IBOutlet weak var switchWateringReminder: UISwitch!
    
    //Enables or disables fertilising reminders.
    @IBOutlet weak var switchFertilisingReminder: UISwitch!
    
    //Stores optional notes about the plant.
    @IBOutlet weak var txtViewNotes: UITextView!
    
    //Displays validation errors to the user.
    @IBOutlet weak var lblValidationMessage: UILabel!
    
    
    
    //MARK: Actions
    
    @IBAction func btnUploadImage(_ sender: UIButton) {
        
        present(imagePicker, animated: true)
        
    }
    
    
    @IBAction func btnSavePlant(_ sender: UIButton) {
        
        guard validateInput()
                
        else {
            return
        }
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
    }
    
    
    //MARK: Properties
    
    //Stores the image selected by the user.
    private var selectedPlantImage: UIImage?
    
    //Used to allow the user to select an image from their photo library.
    private let imagePicker = UIImagePickerController()
    
    
    //MARK: Constants
    
    private let plantNameValidationMessage = "Please enter a valid plant name."
    
    private let plantNameCharactersValidationMessage = "Plant name can only contain letters and spaces."
    
    private let imageValidationMessage = "Please select a plant image."
    
    private let wateringValidationMessage = "Please enter a valid watering frequency."
    
    private let wateringRangeValidationMessage = "Watering frequency must be between 1 and 365 days."
    
    private let fertilisingValidationMessage = "Please enter a valid fertilising frequency."
    
    private let fertilisingRangeValidationMessage = "Fertilising frequency must be between 1 and 12 months."
    
    
    // MARK: Variables
    

    // MARK: Lifecycle
    
    
    //MARK: Validation
    
    private func validateInput() -> Bool {
        
        //Hide any previous validation message.
        lblValidationMessage.isHidden = true
        
        //Check that an image has been selected.
        guard selectedPlantImage != nil
        else {
            
            lblValidationMessage.text = imageValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        //Check that a plant name has been entered.
        guard let plantName = txtPlantName.text, !plantName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            
            lblValidationMessage.text = plantNameValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        //Check that the plant name only contains letters and spaces.
        let allowedCharacters = CharacterSet.letters.union(.whitespaces)
        
        guard plantName.unicodeScalars.allSatisfy({ allowedCharacters.contains($0) })
                
        else {
            
            lblValidationMessage.text = plantNameCharactersValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        //Check that a watering frequency has been entered.
        guard let wateringText = txtWateringFrequency.text, !wateringText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                
        else {
            lblValidationMessage.text = wateringValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        //Check that the watering frequency is a whole number.
        guard let wateringFrequency = Int(wateringText)
                
        else {
            lblValidationMessage.text = wateringValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        //Check that the watering frequency is between 1 and 365 days.
        guard (1...365).contains(wateringFrequency)
                
        else {
            lblValidationMessage.text = wateringRangeValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        
        //Check that a fertilising frequency has been entered.
        guard let fertilisingText = txtFertilisingFrequency.text, !fertilisingText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                
        else {
            lblValidationMessage.text = fertilisingValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        
        //Check that the fertilising frequency is a whole number.
        guard let fertilisingFrequency = Int(fertilisingText)
                
        else {
            
            lblValidationMessage.text = fertilisingValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        
        //Check that the fertilising frequency is between 1 and 12 months.
        guard (1...12).contains(fertilisingFrequency)
                
        else {
            
            lblValidationMessage.text = fertilisingRangeValidationMessage
            lblValidationMessage.isHidden = false
            
            return false
        }
        
        //Everything passed
        return true
    }
    
    
    //MARK: Helper Methods/Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            selectedPlantImage = image
            plantImageView.image = image
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        lblValidationMessage.isHidden = true
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        // Perform any additional setup after loading the view.
    }

}
