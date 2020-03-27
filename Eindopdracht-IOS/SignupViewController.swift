//
//  SignupViewController.swift
//  Eindopdracht-IOS
//
//  Created by Gebruiker on 27/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func CreateNewUser(_ sender: Any) {
        let newEmailData = email.text
        let newPasswordData = password.text
        
        if (newEmailData == "" || newPasswordData == "") {
            return
        }
        
        let masterViewController = MasterViewController()
        self.present(masterViewController, animated: true)
    }
}
