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

struct Athkar {
    var title: String?
    var text: String?
    var ID: String?
}

class AddAthkar: UIViewController {
    
    var delegate: AthkarDelegte?
    
    @IBOutlet weak var titleThekr: UITextField!
    @IBOutlet weak var textThekr: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func saveTheThekr(_ sender: UIButton) {
        let Save = Database.database().reference().child("Athkar").childByAutoId().key
        let titleAndTextThekr = ["title": titleThekr.text, "text": textThekr.text, "key": Save]
        
        Database.database().reference().child("Athkar").child(Save!).setValue(titleAndTextThekr)
        self.delegate?.saveDone()
        
        navigationController?.popViewController(animated: true)
    }
    
}
