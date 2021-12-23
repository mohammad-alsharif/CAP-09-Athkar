//
//  AthkarTableVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 08/05/1443 AH.
//

import UIKit
import Firebase

class AthkarTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = ["Morning Athkar", "Night Athkar", "Pray Athkar" ,"Sleep Athkar"]
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
        let AthkarVC = self.storyboard?.instantiateViewController(withIdentifier: "AthkaryVC") as! AthkaryVC
        navigationController?.pushViewController(AthkarVC, animated: true)
    }
    
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        let UserID = UserDefaults.standard.string(forKey: "UID")
        if UserID != nil {
            
            let AthkarOfTheUserVC = self.storyboard?.instantiateViewController(withIdentifier: "AthkarOfTheUserID") as! AthkarOfTheUser
            navigationController?.pushViewController(AthkarOfTheUserVC, animated: true)
            
        } else {
            let alert = UIAlertController(title: "Hello", message: "You must signUp in App", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
                
                let window = UIApplication.shared.windows.first
                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let VC : UIViewController = storyboard.instantiateViewController(withIdentifier: "NavigationLogin") as! NavigationLogin
                window?.makeKeyAndVisible()
                window?.rootViewController = VC
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
   
}
