//
//  Quran.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 24/05/1443 AH.
//

import Foundation
import UIKit

struct reciters {
    var name : String?
     var suras : String?
    init(name:String,suras : String) {
        self.name = name
        self.suras = suras
    }
}
struct sura {
    var index : String?
    var name : String?
    
    init(name:String,index : String) {
        self.name = name
        self.index = index
    }
}


struct aya {
    var index : String?
    var text : String?
    init(text:String,index : String) {
        self.text = text
        self.index = index
    }
}
