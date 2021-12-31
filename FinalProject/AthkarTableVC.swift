//
//  AthkarTableVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 08/05/1443 AH.
//

import UIKit
import Firebase

class AthkarTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = ["أذكار الصباح", "أذكار المساء", "أذكار الصلاة" ,"أذكار النوم"]
    @IBOutlet weak var tableViewAthkar: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAthkar.delegate = self
        tableViewAthkar.dataSource = self
        tableViewAthkar.register(UINib(nibName: "AthkarCustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            100
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Athkar"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewAthkar.dequeueReusableCell(withIdentifier: "Cell") as! AthkarCustomCell
        cell.Label.text = array[indexPath.row]
        if indexPath.row == 0 {
            cell.viewContainer.backgroundColor = UIColor.blue
        } else if indexPath.row == 1 {
            cell.viewContainer.backgroundColor = UIColor.red
        } else if indexPath.row == 2 {
            cell.viewContainer.backgroundColor = UIColor.brown
        } else {
            cell.viewContainer.backgroundColor = UIColor.green
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let AthkarAlsabah = self.storyboard?.instantiateViewController(withIdentifier: "AthkaAlSabah") as! AthkarCollectionVC
        navigationController?.pushViewController(AthkarAlsabah, animated: true)
    }
    
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        
        Auth.auth().addStateDidChangeListener { Auth, user in
            if user != nil {
                let AddNoteVC = self.storyboard?.instantiateViewController(withIdentifier: "AthkarOfTheUser") as! AthkarOfTheUser
                self.navigationController?.pushViewController(AddNoteVC, animated: true)
                
            } else {
                let alert = UIAlertController(title: "Hello", message: "You must signUp in App", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
                    let appDelegate = AppDelegate()
                    appDelegate.firstPage()
                }))
                self.present(alert, animated: true, completion: nil)
                print("Login")
            }
        }
    }
    
}
