//
//  UpdateVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 11/06/1443 AH.
//

import UIKit
import FirebaseFirestore

class UpdateVC: UIViewController, AthkarDelegte {
    
    func saveDone() {
        updateData()
    }
    
    
    struct Athkar {
        var title: String?
        var text: String?
        var ID: String?
        var image: String?
        var UID: String?
    }
    var delegate : AthkarDelegte?
    let dbFireStore = Firestore.firestore()
    let item = Athkar.init(title: "title", text: "text", ID: "id", image: "image", UID: "UID")
    
    var titleView = ""
    var textView = ""
    var imageView = UIImage()
    
    @IBOutlet weak var titleUpdate: UITextField!
    @IBOutlet weak var textUpdate: UITextView!
    @IBOutlet weak var imageUpdate: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleUpdate.text = titleView
        textUpdate.text = textView
        imageUpdate.image = imageView
        
    }
    
    func updateData() {
        let updateAthkar = ["title": titleUpdate.text!, "text": textUpdate.text!]
               
               dbFireStore.collection("Athkar").document(item.ID!).updateData(updateAthkar)
               
               
               
               let updateDoneVC = storyboard?.instantiateViewController(withIdentifier: "AddAthkar") as! AddAthkar
               navigationController?.popViewController(animated: true)
           }
    
    
    @IBAction func update(_ sender: UIButton) {
       updateData()
        self.delegate?.saveDone()
}
}
