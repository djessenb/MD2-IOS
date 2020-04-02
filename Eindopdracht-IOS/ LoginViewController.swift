import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        let emailData = email.text
        let passwordData = password.text
        
        if (emailData == "" || passwordData == "") {
            error.text = "Please fill in all fields"
            error.alpha = 1
            return
        }
        
        self.signIn(email: emailData!, password: passwordData! ,completion: {  result in
            if result {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        })
    }
    
    func signIn(email: String, password: String, completion: @escaping (Bool)-> ()) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
            if error == nil {
                self.email.alpha = 0
                    
                completion(true)
            } else {
                self.error.text = "Invalid email or password"
                self.error.alpha = 1
                
                completion(false)
            }
        })
        
    }
}
