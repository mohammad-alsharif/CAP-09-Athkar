//
//  AthkarCollectionPage.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 20/05/1443 AH.
//

import UIKit

class AthkarCollectionPage: UICollectionViewCell {
    
    var arrayAthkar = String()
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var thekrLabel: UILabel!
    @IBOutlet weak var thekrCounterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
