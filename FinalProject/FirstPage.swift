//
//  FirstPage.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 21/05/1443 AH.
//

import Foundation
import UIKit
import Firebase

class FirstPage: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        Auth.auth().addStateDidChangeListener { Auth, user in
            if user != nil {
                self.performSegue(withIdentifier: "App", sender: nil)
                print("App")
            } else {
                self.performSegue(withIdentifier: "Login", sender: nil)
                print("Login")
            }
        }
        
    }
}

