//
//  LoginViewController.swift
//  Eindopdracht-IOS
//
//  Created by Gebruiker on 27/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func Login(_ sender: Any) {
        let emailData = email.text
        let passwordData = password.text
        
        if (emailData == "" || passwordData == "") {
            return
        }

        validateLogin(emailData!, passwordData!)
    }
    
    func validateLogin(_ emailData: String, _ passwordData: String) {
        if (emailData ==  "test@testing.nl" && passwordData == "test") {
            let masterViewController = MasterViewController()
            self.present(masterViewController, animated: true)
        }
    }
}
