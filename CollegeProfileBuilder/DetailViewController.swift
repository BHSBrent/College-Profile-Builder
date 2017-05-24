//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Brent Behling on 2/13/17.
//  Copyright © 2017 Brent Behling. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var attendanceField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    //Realm
    let realm = try! Realm()
    var seguePass = Colleges()
    var detailItem: Colleges? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    func configureView() {
        if let Colleges = self.detailItem {
            if(nameField != nil)    {
                nameField.text = Colleges.name
                locationField.text = Colleges.location
                attendanceField.text = String(Colleges.attendance)
                imageView.image = UIImage(data: Colleges.logo)
                urlField.text = String(Colleges.website)
            }
        }
    }

    @IBAction func onSaveTapped(_ sender: UIButton) {
        //Realm
        try! realm.write({
            if let Colleges = self.detailItem {
                Colleges.name = nameField.text!
                Colleges.location = locationField.text!
                Colleges.attendance = Int(attendanceField.text!)!
                Colleges.logo = UIImagePNGRepresentation(imageView.image!)!
                Colleges.website = urlField.text!
                nameField.resignFirstResponder()
                locationField.resignFirstResponder()
                attendanceField.resignFirstResponder()
                urlField.resignFirstResponder()
            }
        })
    }
    
    @IBAction func onTapOutside(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
        locationField.resignFirstResponder()
        attendanceField.resignFirstResponder()
        urlField.resignFirstResponder()        
    }
    
    @IBAction func launchWebsite(_ sender: UIButton) {
        let url = URL(string: urlField.text!)!
        UIApplication.shared.open(url, options: [:], completionHandler : nil)
    }
    
    @IBAction func changeImageButton(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if locationField.text == "" {
            let alert = UIAlertController(title: "Input a location!", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }   else    {
            if let collegeMap = self.detailItem{
                try! realm.write({
                    collegeMap.location = String(locationField.text!)!
                })
                let forward = segue.destination as! MapViewController
                forward.title = "\(nameField.text)"
                forward.college = collegeMap
            }
        }
    }
}
