//
//  AddAthkar.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit
import Firebase

class AddAthkar: UIViewController {

    @IBOutlet weak var titleThekr: UILabel!
    @IBOutlet weak var textThekr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func saveTheThekr(_ sender: UIButton) {
        let Save = Database.database().reference().child("Athkar").childByAutoId().key
        let titleAndTextThekr = ["tile": titleThekr.text, "text": textThekr.text, "key": Save]
        
        //Database.database().reference().child("Athkar").child(Save).setValue(titleAndTextThekr)
    }
    
}
