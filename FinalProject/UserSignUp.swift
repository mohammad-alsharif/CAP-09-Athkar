//
//  UserSignUp.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 09/05/1443 AH.
//

import UIKit
import Firebase

class UserSignUp: UIViewController {

    @IBOutlet weak var signUpEmail: UITextField!
    @IBOutlet weak var signUpMobile: UITextField!
    @IBOutlet weak var signUpPassword: UITextField!
    @IBOutlet weak var signUpRePassword: UITextField!
    @IBOutlet weak var registrationInformation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //
    
    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: signUpEmail.text!, password: signUpPassword.text!) { result, error in
            if error == nil {
                self.registrationInformation.text = "You have been successfully registered"
                self.registrationInformation.textColor = UIColor.green
                
                
                let UID = result?.user.uid
                
                UserDefaults.standard.set(UID, forKey: "UID")
                
                // write to Database firbase
                let array = ["email": self.signUpEmail.text!, "mobile": self.signUpMobile.text!, "type": "0", "UID": UID]
                
                let db = Database.database().reference()
                db.child("User").child(UID!).setValue(array)
                
                let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginID") as! UserLogin
                self.navigationController?.pushViewController(SignUpVC, animated: true)
                
            } else {
                    self.registrationInformation.text = error?.localizedDescription
                    self.registrationInformation.textColor = UIColor.red
                }
                
            }
        }
    }
