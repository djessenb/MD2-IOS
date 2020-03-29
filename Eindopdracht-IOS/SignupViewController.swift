//
//  SignupViewController.swift
//  Eindopdracht-IOS
//
//  Created by Gebruiker on 27/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CreateNewUser(_ sender: Any) {
        let newEmailData = newEmail.text
        let newPasswordData = newPassword.text
        
        if (newEmailData == "" || newPasswordData == "") {
            error.text = "Please fill in all fields"
            error.alpha = 1
            return
        }
        
        createNewUser(newEmailData!, newPasswordData!)
    }
    
    func createNewUser(_ emailData: String, _ passwordData: String) {
        Auth.auth().createUser(withEmail: emailData, password: passwordData) { (result, error) in
            
            if (error == nil) {
                self.goToHome()
            }
        }
    }
    
    func goToHome() {
        let masterViewController = MasterViewController()
        view.window?.rootViewController = masterViewController
        view.window?.makeKeyAndVisible()
    }
}
