//
//  LoginViewController.swift
//  Eindopdracht-IOS
//
//  Created by Gebruiker on 27/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Login(_ sender: Any) {
        let emailData = email.text
        let passwordData = password.text
        
        if (emailData == "" || passwordData == "") {
            error.text = "Please fill in all fields"
            error.alpha = 1
            return
        }
        
        validateLogin(emailData!, passwordData!)
    }
    
    func validateLogin(_ emailData: String, _ passwordData: String) {
        Auth.auth().signIn(withEmail: emailData, password: passwordData) { [weak self] (result, err) in
            guard let strongSelf = self else { return }
            
            if (err == nil) {
                strongSelf.error.alpha = 0
                strongSelf.goToHome()
            } else {
                strongSelf.error.text = "Invalid email or password"
                strongSelf.error.alpha = 1
            }
        }
    }
    
    func goToHome() {
        let masterViewController = MasterViewController()
        view.window?.rootViewController = masterViewController
        view.window?.makeKeyAndVisible()
    }
}
