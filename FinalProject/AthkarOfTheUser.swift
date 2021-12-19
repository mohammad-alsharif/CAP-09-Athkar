//
//  AthkarOfTheUser.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit

class AthkarOfTheUser: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addingTheThekr(_ sender: UIButton) {
        let AddingTheThekrVC = storyboard?.instantiateViewController(withIdentifier: "AddAthkar") as! AddAthkar
        navigationController?.pushViewController(AddingTheThekrVC, animated: true)
    }
    //

}
