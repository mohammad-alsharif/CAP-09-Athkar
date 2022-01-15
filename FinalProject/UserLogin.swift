//
//  UserLogin.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 09/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class UserLogin: UIViewController {
    
    let dbFireStore = Firestore.firestore()
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginInformation: UILabel!
    @IBOutlet weak var loginActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginActivity.startAnimating()
        loginActivity.isHidden = true
    }
    
    @IBAction func Login(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: loginEmail.text!, password: loginPassword.text!) { result, error in
            if error == nil {
                self.loginActivity.isHidden = false
                self.loginInformation.text = "تم تسحيل الدخول بنجاح"
                self.loginInformation.textColor = UIColor.green
                print(result?.user.uid ?? "")
                
                let uidLogin = result?.user.uid ?? ""
                
                UserDefaults.standard.set(uidLogin, forKey: "UID")
                
                // MARK: Get Data from FireStore
                
                self.dbFireStore.collection("User").document(uidLogin).getDocument { (document, error) in
                    if let document = document, document.exists {
                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        print("Document data: \(dataDescription)")
                        let window = UIApplication.shared.windows.first
                        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController : UIViewController = storyboard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
                        window?.makeKeyAndVisible()
                        window?.rootViewController = viewController
                    } else {
                        print("Document does not exist")
                    }
                }
                
                
                
            } else {
                self.loginActivity.isHidden = false
                self.loginInformation.text = "Wrong email or password"
                self.loginInformation.textColor = UIColor.red
                print(error?.localizedDescription ?? "")
            }
        }
        
    }
}
