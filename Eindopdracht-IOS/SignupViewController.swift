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
        
        self.createNewUser(newEmailData!, newPasswordData! ,completion: {  result in
            if result {
                self.performSegue(withIdentifier: "signUpSegue", sender: self)
            }
        })
    }
    
    func createNewUser(_ email: String, _ password: String, completion: @escaping (Bool)-> ()) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            if error == nil {
                completion(true)
            }
        })
    }
    
    func goToHome() {
        let masterViewController = MasterViewController()
        view.window?.rootViewController = masterViewController
        view.window?.makeKeyAndVisible()
    }
}
