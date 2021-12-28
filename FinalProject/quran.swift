//
//  quran.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 16/05/1443 AH.
//

import UIKit
import Alamofire

class quran: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var quranResponse : Welcome!
    var t = ""
    // http://api.alquran.cloud/v1/edition
    
    @IBOutlet weak var tableViewQuran: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = t
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewQuran.delegate = self
        tableViewQuran.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("")
    }
}
