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
    let db = Database.database().reference()
    var imageURL = ""
    
    @IBOutlet weak var titleThekr: UITextField!
    @IBOutlet weak var textThekr: UITextView!
    @IBOutlet weak var imageThekr: UIImageView!
    @IBOutlet weak var viewDescribtion: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textThekr.delegate = self
        textThekr.text = "وصف"
        textThekr.textColor = UIColor.lightGray
        
        viewDescribtion.layer.borderColor = UIColor.lightGray.cgColor
        viewDescribtion.layer.borderWidth = 1
        
        imageThekr.isUserInteractionEnabled = true
        
    }
    
    @IBAction func saveTheThekr(_ sender: UIButton) {
        addDataToFirebase()
    }
    
    func uploadImage() {
        // MARK: identifer image by key for child chalet
        let key = db.child("Athkar").childByAutoId().key

        // MARK: convert image to data
        let imageData = self.imageThekr.image?.jpegData(compressionQuality: 0.5)

        // MARK: Upload image data to storage
        Storage.storage().reference().child(key!).putData(imageData!, metadata: nil, completion: { (metadata, error) in

            if error == nil {
                guard let metadata = metadata else {
                    print("error")
                    return
                }
                // MARK: download URL for image Uploaded
                Storage.storage().reference().child(key!).downloadURL { [self] (url, error) in
                    
                    guard let downloadURL = url else {
                        print("error")
                        return
                    }
                    
                    imageURL = downloadURL.absoluteString 
                    // MARK: download Image
                    
                }
                
            } else {

            }

        })
    }

    func addDataToFirebase() {
        // MARK: add data  firebase + add downloadURL for image in storage
        //        let uid = UserDefaults.standard.string(forKey: "uidKey")
        
        let key = db.child("Athkar").childByAutoId().key
        
        if self.titleThekr.text == "" && self.textThekr.text == "" || self.textThekr.text == "وصف"  {
            print("الرجاء تعبئة الحقول")
            
        } else {
            let UID = UserDefaults.standard.string(forKey: "UID")
            let titleAndTextThekr = [
                                     "title": self.titleThekr.text! ,
                                     "text": self.textThekr.text! ,
                                     "key": key ,
                                     "UID": UID ,
                                     "image": imageURL]
            
            db.child("Athkar").child(UID!).child(key!).setValue(titleAndTextThekr)
            self.delegate?.saveDone()
            
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func download(_ sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        self.imageThekr.image = image
        uploadImage()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textThekr.textColor == UIColor.lightGray {
            textThekr.text = ""
            textThekr.textColor = UIColor.black
        }
    }
    
}
