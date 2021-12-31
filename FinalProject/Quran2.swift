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
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    private func parse(jsonData: Data) {
        do {
            //create json object from data
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed)  as? [String: Any] {
                print(json as! ["name"])
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    var quranResponse : Welcome!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func QuranS(_ sender: Any) {
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        let quranURL : URL = URL(string: "https://api.alquran.cloud/v1/edition")!
//
//        self.loadJson(fromURLString: quranURL.absoluteString) { (result) in
//            switch result {
//            case .success(let data):
//                self.parse(jsonData: data)
//            case .failure(let error):
//                print(error)
//            }
//        }
////        let quranURL : URL = URL(string: "https://api.alquran.cloud/v1/edition")!
////        let request = URLRequest(url: quranURL)
////        let sessionTask = URLSession.shared.dataTask(with: request) { data, response, error in
////            let jsonDecoder = JSONDecoder()
////            let responseObject = try! jsonDecoder.decode(Welcome.self, from: data!)
////            self.quranResponse = responseObject
////            let response = responseObject.data as NSArray
////            do {
////                let json = try JSONSerialization.jsonObject(with: data!) as? [Any]
////                print(json)
////            }
////            catch {
////               print(error)
////            }
////
////            for i in response {
//////                let responseI = i as! [String: Any]
//////                print(responseI)
//////                print(responseI)
////            }
////
////        }
////        sessionTask.resume()
//        performSegue(withIdentifier: "goToTable", sender: nil)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let quranVC = segue.destination as! quran
//        quranVC.quranResponse = self.quranResponse
//    }
//
//}
