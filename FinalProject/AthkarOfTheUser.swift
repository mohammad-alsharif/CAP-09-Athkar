//
//  AthkarOfTheUser.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit
import Firebase

class AthkarOfTheUser: UIViewController, UITableViewDelegate, UITableViewDataSource, AthkarDelegte {
    
    var arrayAthkar = [Athkar]()

    @IBOutlet weak var tableViewAthkar: UITableView!
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var circleButton: UIButton!
    
    
    func saveDone() {
        tableViewAthkar.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayAthkar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewAthkar.dequeueReusableCell(withIdentifier: "Cell") as! AthkarOfTheUserCell
        cell.titleThekr.text = arrayAthkar[indexPath.row].title ?? ""
        cell.textThekr.text = arrayAthkar[indexPath.row].text ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleButton.layer.cornerRadius = circleButton.bounds.height / 2
        circleButton.layer.borderColor = UIColor.white.cgColor
        circleButton.layer.borderWidth = 10
        
        let n = UINib(nibName: "AthkarOfTheUserCell", bundle: nil)
        tableViewAthkar.register(n, forCellReuseIdentifier: "Cell")
        tableViewAthkar.delegate = self
        tableViewAthkar.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityData.startAnimating()
        activityData.isHidden = false
        
        self.arrayAthkar.removeAll()
        tableViewAthkar.reloadData()
        
        let UID = UserDefaults.standard.string(forKey: "UID")!
        Database.database().reference().child("Athkar").child(UID).observe(.value) { snapshot in
            
            for i in snapshot.children {
                let snap = i as! DataSnapshot
                let snap2 = snap.value as! [String: String]
                let title = snap2["title"]
                let text = snap2["text"]
                let newStruct = Athkar(title: title, text: text)
                self.arrayAthkar.append(newStruct)
                DispatchQueue.main.async {
                    self.tableViewAthkar.reloadData()
                    
                    self.activityData.startAnimating()
                    self.activityData.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addingTheThekr(_ sender: UIButton) {
        let AddingTheThekrVC = storyboard?.instantiateViewController(withIdentifier: "AddAthkar") as! AddAthkar
        navigationController?.pushViewController(AddingTheThekrVC,animated: true)
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            
        } catch let signOutError as NSError {
            print("Error", signOutError)
        }
        let AppDelegate = AppDelegate()
        AppDelegate.firstPage()
    }
}
