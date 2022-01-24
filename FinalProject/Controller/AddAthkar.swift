//
//  AddAthkar.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseStorage

protocol AthkarDelegte {
    func saveDone()
}

class AddAthkar: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var delegate: AthkarDelegte?
    let dbFireStore = Firestore.firestore()
    var imageURL = ""
    
    @IBOutlet weak var titleThekr: UITextField!
    @IBOutlet weak var textThekr: UITextView!
    @IBOutlet weak var imageThekr: UIImageView!
    @IBOutlet weak var viewDescribtion: UIView!
    @IBOutlet weak var activityUpload: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textThekr.delegate = self
        textThekr.text = "وصف"
        
        if self.traitCollection.userInterfaceStyle == .dark {
            // User Interface is Dark
            textThekr.textColor = UIColor.white
        } else {
            // User Interface is Light
            textThekr.textColor = UIColor.lightGray
        }
        
        viewDescribtion.layer.borderColor = UIColor.lightGray.cgColor
        viewDescribtion.layer.borderWidth = 1
        
        imageThekr.isUserInteractionEnabled = true
        
    }
    
    
    
    func uploadImage() {
        activityUpload.startAnimating()
        
        
        let UID = UserDefaults.standard.string(forKey: "UID")
        
        let key = dbFireStore.collection("Athkar").document().documentID
        
        // MARK: convert image to data
        let imageData = self.imageThekr.image?.jpegData(compressionQuality: 0.5)
        
        // MARK: Upload image data to storage
        Storage.storage().reference().child(key).putData(imageData!, metadata: nil, completion: { (metadata, error) in
            
            if error == nil {
                guard let metadata = metadata else {
                    print("error")
                    self.activityUpload.stopAnimating()

                    return
                }
                // MARK: download URL for image Uploaded
                Storage.storage().reference().child(key).downloadURL { [self] (url, error) in
                    
                    guard let downloadURL = url else {
                        print("error")
                        self.activityUpload.stopAnimating()

                        return
                    }
                    // MARK: download Image
                    imageURL = downloadURL.absoluteString
                    addDataToFireStore()
                    
                }
                
            } else {
                
            }
            
        })
    }
    
    func addDataToFireStore() {
        // MARK: add data  FireStore + add downloadURL for image in storage
        let UID = UserDefaults.standard.string(forKey: "UID")
        
        let key = dbFireStore.collection("Athkar").document().documentID
        
        if self.titleThekr.text == "" && self.textThekr.text == "" || self.textThekr.text == "وصف"  {
            print("الرجاء تعبئة الحقول")
            
        } else {
            let Data = ["title": titleThekr.text!, "text": textThekr.text!, "ID": key, "image": imageURL, "UID": UID]
            dbFireStore.collection("Athkar").document(key).setData(Data) { err in
                if err == nil {
                    self.activityUpload.stopAnimating()
                }
            }
            self.delegate?.saveDone()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        self.imageThekr.image = image
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textThekr.textColor == UIColor.lightGray {
            textThekr.text = ""
            textThekr.textColor = UIColor.black
        }
    }
    
    @IBAction func saveTheThekr(_ sender: UIButton) {
        uploadImage()
    }
    
    @IBAction func download(_ sender: UITapGestureRecognizer) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.allowsEditing = true
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
    
}
