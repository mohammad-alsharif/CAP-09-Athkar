//
//  AthkarCustomCell.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 08/05/1443 AH.
//

import UIKit

class AthkarCustomCell: UITableViewCell {
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.Label.textColor = UIColor.white
        viewContainer.layer.cornerRadius = 16
    }
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
