//
//  AthkarTableVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 08/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class AthkarTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = ["أذكار الصباح", "أذكار المساء", "أذكار الصلاة", "أذكار الطعام", "أذكار النوم"]
    
    @IBOutlet weak var tableViewAthkar: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAthkar.delegate = self
        tableViewAthkar.dataSource = self
        tableViewAthkar.register(UINib(nibName: "AthkarCustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        136
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewAthkar.dequeueReusableCell(withIdentifier: "Cell") as! AthkarCustomCell
        cell.Label.text = array[indexPath.row]
        if indexPath.row == 0 {
            cell.imageAthkarTableVC.image = UIImage(named: "Morning Athkar")
        } else if indexPath.row == 1 {
            cell.imageAthkarTableVC.image = UIImage(named: "Night Athkar")
        } else if indexPath.row == 2 {
            cell.imageAthkarTableVC.image = UIImage(named: "Prayer Athkar")
        } else if indexPath.row == 3 {
            cell.imageAthkarTableVC.image = UIImage(named: "Food Athkar")
        } else {
            cell.imageAthkarTableVC.image = UIImage(named: "Sleep Athkar")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let athkarVC = self.storyboard?.instantiateViewController(withIdentifier: "AthkarCollectionVC") as! AthkarCollectionVC

        if indexPath.row == 0 {

            athkarVC.index = indexPath.row
            navigationController?.pushViewController(athkarVC, animated: true)
            
        } else if indexPath.row == 1 {

            athkarVC.index = indexPath.row
            navigationController?.pushViewController(athkarVC, animated: true)
            
        } else if indexPath.row == 2 {
        
            athkarVC.index = indexPath.row
            navigationController?.pushViewController(athkarVC, animated: true)
            
        } else if indexPath.row == 3 {

            athkarVC.index = indexPath.row
            navigationController?.pushViewController(athkarVC, animated: true)
            
        } else {

            athkarVC.index = indexPath.row
            navigationController?.pushViewController(athkarVC, animated: true)
        }
    }
    
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        
        let UID = UserDefaults.standard.string(forKey: "UID")
        
        if UID != nil {
            let AddNoteVC = self.storyboard?.instantiateViewController(withIdentifier: "AthkarOfTheUser") as! AthkarOfTheUser
            self.navigationController?.pushViewController(AddNoteVC, animated: true)
            
        } else {
            let alert = UIAlertController(title: "مرحباً", message: "يجب عليك عمل حساب لإستخدام هذه الميزة", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "حسناً", style: UIAlertAction.Style.default, handler: { UIAlertAction in
                let appDelegate = AppDelegate()
                appDelegate.firstPage()
            }))
            self.present(alert, animated: true, completion: nil)
            print("Login")
        }
    }
}

