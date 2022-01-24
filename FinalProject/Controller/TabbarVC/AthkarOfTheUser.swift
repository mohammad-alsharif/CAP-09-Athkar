//
//  AthkarOfTheUser.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit
import Firebase
import SDWebImage
import SwiftUI

class AthkarOfTheUser: UIViewController, UITableViewDelegate, UITableViewDataSource, AthkarDelegte {
    
    var dbFireStore = Firestore.firestore()
    var arrayAthkar = [Athkar]()
    
    @IBOutlet weak var tableViewAthkar: UITableView!
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var circleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAthkar.backgroundColor = UIColor(named: "Background")
        
        circleButton.layer.cornerRadius = circleButton.bounds.height / 2
        circleButton.layer.borderColor = UIColor.white.cgColor
        circleButton.layer.borderWidth = 10
        
        let n = UINib(nibName: "AthkarOfTheUserCell", bundle: nil)
        tableViewAthkar.register(n, forCellReuseIdentifier: "Cell")
        tableViewAthkar.delegate = self
        tableViewAthkar.dataSource = self
        
        getData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayAthkar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewAthkar.dequeueReusableCell(withIdentifier: "Cell") as! AthkarOfTheUserCell
        let item = arrayAthkar[indexPath.row]
        cell.titleThekr.text = item.title
        cell.imageThekr.sd_setImage(with: URL(string: item.image ?? ""), placeholderImage: UIImage(named: "imagePlaseHolder"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = arrayAthkar[indexPath.row]
        
        let update = storyboard?.instantiateViewController(withIdentifier: "UpdateVC") as! UpdateVC
        
        update.delegate = self
        
        update.titleView = item.title ?? ""
        update.textView = item.text ?? ""
        update.imageView = item.image ?? ""
        update.key = item.ID ?? ""
        
        navigationController?.pushViewController(update, animated: true)
        
    }
    
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = arrayAthkar[indexPath.row]
        
        dbFireStore.collection("Athkar").document(item.ID!).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
        
        arrayAthkar.remove(at: indexPath.row)
        tableViewAthkar.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    
    func getData() {
        activityData.startAnimating()
        activityData.isHidden = false
        guard let userUID = Auth.auth().currentUser?.uid else {return}
        
        // MARK: get data from firbase
        dbFireStore.collection("Athkar").whereField("UID", isEqualTo: userUID).getDocuments() { (querySnapshot, error) in
            self.activityData.stopAnimating()
            self.activityData.isHidden = true
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let id = document.data()["ID"] as? String
                    let title = document.data()["title"] as? String
                    let text = document.data()["text"] as? String
                    let image = document.data()["image"] as? String
                    let UID = document.data()["UID"] as? String
                    
                    self.arrayAthkar.append(Athkar.init(title: title, text: text, ID: id, image: image, UID: UID))
                    
                }
                
                self.tableViewAthkar.reloadData()
            }
        }
        
    }
    
    func saveDone() {
        arrayAthkar.removeAll()
        tableViewAthkar.reloadData()
        getData()
        
    }
    
    @IBAction func addingTheThekr(_ sender: UIButton) {
        let AddingTheThekrVC = storyboard?.instantiateViewController(withIdentifier: "AddAthkar") as! AddAthkar
        AddingTheThekrVC.delegate = self
        navigationController?.pushViewController(AddingTheThekrVC,animated: true)
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            
        } catch let signOutError as NSError {
            print("Error", signOutError)
        }
        UserDefaults.standard.removeObject(forKey: "UID")
        let AppDelegate = AppDelegate()
        AppDelegate.firstPage()
    }
}
