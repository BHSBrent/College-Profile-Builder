//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Brent Behling on 2/13/17.
//  Copyright © 2017 Brent Behling. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var attendanceField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    var detailItem: Colleges? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        if let Colleges = self.detailItem {
            if(nameField != nil)    {
                nameField.text = Colleges.name
                locationField.text = Colleges.location
                attendanceField.text = String(Colleges.attendance)
                imageView.image = UIImage(data: Colleges.logo)
            }
        }
    }

    @IBAction func onSaveTapped(_ sender: UIButton) {
        if let Colleges = self.detailItem {
            Colleges.name = nameField.text!
            Colleges.location = locationField.text!
            Colleges.attendance = Int(attendanceField.text!)!
            Colleges.logo = UIImagePNGRepresentation(imageView.image!)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

