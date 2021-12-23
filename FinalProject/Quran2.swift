//
//  Quran2.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 17/05/1443 AH.
//

import UIKit
import Alamofire
// MARK: - Welcome
struct Welcome: Codable {
    let code: Int
    let status: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let identifier, language, name, englishName: String
    let format: Format
    let type: TypeEnum
    let direction: Direction?
}

enum Direction: String, Codable {
    case ltr = "ltr"
    case rtl = "rtl"
}

enum Format: String, Codable {
    case audio = "audio"
    case text = "text"
}

enum TypeEnum: String, Codable {
    case quran = "quran"
    case tafsir = "tafsir"
    case translation = "translation"
    case transliteration = "transliteration"
    case versebyverse = "versebyverse"
}
class Quran2: UIViewController {
    var quranResponse : Welcome!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func QuranS(_ sender: Any) {
        let quranURL : URL = URL(string: "https://api.alquran.cloud/v1/edition")!
        let request = URLRequest(url: quranURL)
        let sessionTask = URLSession.shared.dataTask(with: request) { data, response, error in
            let jsonDecoder = JSONDecoder()
            let responseObject = try! jsonDecoder.decode(Welcome.self, from: data!)
            self.quranResponse = responseObject
            print(responseObject)
        }
        sessionTask.resume()
        performSegue(withIdentifier: "goToTable", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quranVC = segue.destination as! quran
        quranVC.quranResponse = self.quranResponse
    }

}
