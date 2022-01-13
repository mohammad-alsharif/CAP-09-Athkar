//
//  UserSignUp.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 09/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class UserSignUp: UIViewController {
    
    let dbFireStore = Firestore.firestore()

    @IBOutlet weak var signUpEmail: UITextField!
    @IBOutlet weak var signUpPassword: UITextField!
    @IBOutlet weak var signUpRePassword: UITextField!
    @IBOutlet weak var registrationInformation: UILabel!
    @IBOutlet weak var signUpActivity: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpActivity.startAnimating()
        signUpActivity.isHidden = true
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if signUpPassword.text == signUpRePassword.text {
            Auth.auth().createUser(withEmail: signUpEmail.text!, password: signUpPassword.text!) { result, error in
                
                if error == nil {
                    self.signUpActivity.isHidden = false
                    self.registrationInformation.text = "You have been successfully registered"
                    self.registrationInformation.textColor = UIColor.green
                    
                    let uidSignUp = result?.user.uid
                    
                    UserDefaults.standard.set(uidSignUp, forKey: "UID")
                    
                    // write to Database firbase
                    let arraySignUp = ["email": self.signUpEmail.text!, "type": "0", "UID": uidSignUp]
                    
                    self.dbFireStore.collection("User").document(uidSignUp!).setData(arraySignUp)
                    
                    let window = UIApplication.shared.windows.first
                    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController : UIViewController = storyboard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
                    window?.makeKeyAndVisible()
                    window?.rootViewController = viewController
                    
                } else {
                    self.registrationInformation.text = error?.localizedDescription
                    self.registrationInformation.textColor = UIColor.red
                    self.signUpActivity.isHidden = false
                }
            }
        } else {
            print("error")
        }
    }
}
