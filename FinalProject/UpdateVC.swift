//
//  UpdateVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 11/06/1443 AH.
//

import UIKit
import FirebaseFirestore

class UpdateVC: UIViewController {
    
    struct Athkar {
        var title: String?
        var text: String?
        var ID: String?
        var image: String?
        var UID: String?
    }
    
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
    
    @IBAction func update(_ sender: UIButton) {
        
        
        
        dbFireStore.collection("Athkar").document(item.ID!).updateData(["Athkar": FieldValue.delete(),
        ]) { error in
            
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated")
            }
        }
        
        let updateDoneVC = storyboard?.instantiateViewController(withIdentifier: "AddAthkar") as! AddAthkar
        navigationController?.popViewController(animated: true)
    }
    
}
