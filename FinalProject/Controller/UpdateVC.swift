//
//  UpdateVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 11/06/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import SceneKit

class UpdateVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: AthkarDelegte?
    let dbFireStore = Firestore.firestore()
    let item = Athkar.init(title: "title", text: "text", ID: "id", image: "image", UID: "UID")
    
    var titleView = ""
    var textView = ""
    var imageView = ""
    var key = ""
    var isFinish = false
    var isImageUpload = false
    
    @IBOutlet weak var titleUpdate: UITextField!
    @IBOutlet weak var textUpdate: UITextView!
    @IBOutlet weak var imageUpdate: UIImageView!
    @IBOutlet weak var activityUpload: UIActivityIndicatorView!
    @IBOutlet weak var outletUpload: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.traitCollection.userInterfaceStyle == .dark {
            // User Interface is Dark
            textUpdate.textColor = UIColor.white
        } else {
            // User Interface is Light
            textUpdate.textColor = UIColor.lightGray
        }
        titleUpdate.text = titleView
        textUpdate.text = textView
        imageUpdate.sd_setImage(with: URL(string: imageView ), placeholderImage: UIImage(named: "imagePlaseHolder"))
        
        imageUpdate.isUserInteractionEnabled = true
    }
    func uploadDataWithOutImage() {
        let UID = UserDefaults.standard.string(forKey: "UID")
        
        let updateAthkar = ["title": titleUpdate.text!, "text": textUpdate.text!, "ID": key, "image": imageView, "UID": UID]
        
        dbFireStore.collection("Athkar").document(key).updateData(updateAthkar)
        
        self.delegate?.saveDone()
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateData() {
        if isImageUpload == true{
            uploadDataWithImage()
            
        }else{
            uploadDataWithOutImage()
        }
       
    }
    
    func uploadDataWithImage() {
        let imageData = self.imageUpdate.image?.jpegData(compressionQuality: 0.5)
        
        Storage.storage().reference().child(key).putData(imageData!, metadata: nil) { (metadata, error) in
            
            if error == nil {
                guard let metadata = metadata else {
                    print("error r")
                    return
                }
                
                Storage.storage().reference().child(self.key).downloadURL { [self] (url , error) in
                    guard let downloadURL = url else {
                        print("error")
                        return
                    }
                    imageView =  downloadURL.absoluteString
                    let UID = UserDefaults.standard.string(forKey: "UID")
                    
                    let updateAthkar = ["title": titleUpdate.text!, "text": textUpdate.text!, "ID": key, "image": imageView, "UID": UID]
                    
                    dbFireStore.collection("Athkar").document(key).updateData(updateAthkar)
                    
                    self.delegate?.saveDone()
                    
                    navigationController?.popViewController(animated: true)
                    
                }
                
            }
        }
    }

 
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        isImageUpload = true
        self.imageUpdate.image = image
        
    }
    
    
    
    @IBAction func updateImageTapGesture(_ sender: UITapGestureRecognizer) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.allowsEditing = true
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func update(_ sender: UIButton) {
        updateData()
        
    }
}
