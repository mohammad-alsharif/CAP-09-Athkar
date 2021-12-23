//
//  AthkarOfTheUser.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 15/05/1443 AH.
//

import UIKit
import Firebase

class AthkarOfTheUser: UIViewController, UITableViewDelegate, UITableViewDataSource, AthkarDelegte {
    
    var arr = [Athkar]()

    @IBOutlet weak var tableViewAthkar: UITableView!
    
    func saveDone() {
        tableViewAthkar.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewAthkar.dequeueReusableCell(withIdentifier: "Cell") as! AthkarOfTheUserCell
        cell.titleThekr.text = arr[indexPath.row].title ?? ""
        cell.textThekr.text = arr[indexPath.row].text ?? ""
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let n = UINib(nibName: "AthkarOfTheUserCell", bundle: nil)
        tableViewAthkar.register(n, forCellReuseIdentifier: "Cell")
        tableViewAthkar.delegate = self
        tableViewAthkar.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Database.database().reference().child("Athkar").observeSingleEvent(of: .value) { snapshot in
            print(snapshot.childrenCount)
            for i in snapshot.children {
                let snap = i as! DataSnapshot
                let snap2 = snap.value as! [String: String]
                let tile = snap2["tile"]
                let text = snap2["text"]
                let newStruct = Athkar(title: tile, text: text)
                self.arr.append(newStruct)
                DispatchQueue.main.async {
                    self.tableViewAthkar.reloadData()
                }
            }
        }
    }
    
    @IBAction func addingTheThekr(_ sender: UIButton) {
        let AddingTheThekrVC = storyboard?.instantiateViewController(withIdentifier: "AddAthkar") as! AddAthkar
        navigationController?.pushViewController(AddingTheThekrVC, animated: true)
    }

}
