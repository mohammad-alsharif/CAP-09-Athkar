//
//  AddAthkar.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit
import Firebase

protocol AthkarDelegte {
    func saveDone()
}

class AddAthkar: UIViewController {
    
    var delegate: AthkarDelegte?
    
    @IBOutlet weak var titleThekr: UITextField!
    @IBOutlet weak var textThekr: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func saveTheThekr(_ sender: UIButton) {
        let Save = Database.database().reference().child("Athkar").childByAutoId().key
        let UID = UserDefaults.standard.string(forKey: "UID")
        let titleAndTextThekr = ["title": titleThekr.text, "text": textThekr.text, "key": Save, "UID": UID]
        print(UID)
        
        Database.database().reference().child("Athkar").child(UID!).child(Save!).setValue(titleAndTextThekr)
        self.delegate?.saveDone()
        
        navigationController?.popViewController(animated: true)
    }
    
}
