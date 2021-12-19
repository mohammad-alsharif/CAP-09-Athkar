//
//  Sebha.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 10/05/1443 AH.
//

import UIKit

class Sebha: UIViewController {
    
    var counter = 0
    var typeCounter = 0

    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var tasbeh: UIImageView!
    @IBOutlet weak var segmentSebha: UISegmentedControl!
    @IBOutlet weak var Button: UIButton!
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Button.layer.cornerRadius = Button.bounds.height / 2
        Button.layer.borderColor = UIColor.white.cgColor
        Button.layer.borderWidth = 10

        tasbeh.isUserInteractionEnabled = true
        let tasbeh = UIGestureRecognizer(target: self, action: #selector(tapGestureRecognizerCounter))
        
    }
    
    @IBAction func tapGestureRecognizerCounter(_ sender: UITapGestureRecognizer) {
        if segmentSebha.selectedSegmentIndex == 0 {
            typeCounter = 10
            if counter == typeCounter {
                
            } else {
                counter += 1
                labelCounter.text = String(counter)
            }
            
            
        } else if segmentSebha.selectedSegmentIndex == 1 {
            typeCounter = 33
            if counter == typeCounter {
                
            } else {
            counter += 1
            labelCounter.text = String(counter)
            }
            
            
        } else {
            typeCounter = 100
            if counter == typeCounter {
                
            } else {
                counter += 1
                labelCounter.text = String(counter)
            }
            
        }
    }
    
    
    @IBAction func restCounter(_ sender: UIButton) {
        counter = 0
        labelCounter.text = String(counter)
    }
    

}
