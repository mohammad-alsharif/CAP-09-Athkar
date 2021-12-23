//
//  UserLogin.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 09/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class UserLogin: UIViewController {
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginInformation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    //
    
    @IBAction func signUp(_ sender: UIButton) {
        let SignOutVC = storyboard?.instantiateViewController(withIdentifier: "SignUpID") as! UserSignUp
        present(SignOutVC, animated: true, completion: nil)
    }
    
    @IBAction func Login(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: loginEmail.text!, password: loginPassword.text!) { result, error in
            if error == nil {
                print(result?.user.uid ?? "")
                
                // Read to Database firebase
                let userID = result?.user.uid ?? ""
                
                UserDefaults.standard.set(userID, forKey: "UID")
                
                let db = Database.database().reference()
                db.child("User").child(userID).observeSingleEvent(of: .value) { DataSnapshot in
                    let value = DataSnapshot.value as? NSDictionary
                    
                    let email = value?["email"] as? String ?? ""
                    print(email)
                    
                    let window = UIApplication.shared.windows.first
                    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc : UIViewController = storyboard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
                    window?.makeKeyAndVisible()
                    window?.rootViewController = vc                }
                
                
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
        
    }
}
