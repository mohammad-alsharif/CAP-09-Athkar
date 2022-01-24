//
//  ViewController.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 07/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logInLabel: UIButton!
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var skipLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // corner radius
        signUpLabel.layer.cornerRadius = 16
        logInLabel.layer.cornerRadius = 16
        skipLabel.layer.cornerRadius = 16
        
    }

    @IBAction func logIn(_ sender: UIButton) {
        let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginID") as! UserLogin
        navigationController?.pushViewController(LoginVC, animated: true)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpID") as! UserSignUp
        navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
    @IBAction func tabBar(_ sender: UIButton) {
        let window = UIApplication.shared.windows.first
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UIViewController = storyboard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        window?.makeKeyAndVisible()
        window?.rootViewController = viewController
    }
    
    
    
}

