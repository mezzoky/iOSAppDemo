//
//  ViewController.swift
//  FoodTracker
//
//  Created by kangyaw on 18/06/2017.
//  Copyright © 2017 kangyaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var nameTextInput: UITextField!
    @IBOutlet weak var photoImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // handdle the text field's user input through delegate callbacks
        nameTextInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegate
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        // question on more than one textField: https://stackoverflow.com/q/5683376
        mealLabel.text = textField.text
    }

    // MARK: action
    @IBAction func setLabel(_ sender: UIButton) {
        print("passing here")
        mealLabel.text = "setted the new Text at Meal Name"
    }
    @IBAction func selectImgFromPhotoLib(_ sender: UITapGestureRecognizer) {
        nameTextInput.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        // only allow photos to be picked
        imagePickerController.sourceType = .photoLibrary
        
        // make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss the picker if the user cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // the info dictionary may contain multiple representations of the image
        // you want to use original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
                fatalError("Expected a dictionary containing an image, but as provided the following: \(info)")
        }
        photoImgView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }


}

