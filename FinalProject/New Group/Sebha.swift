//
//  Sebha.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 10/05/1443 AH.
//

import UIKit
import QuartzCore

class Sebha: UIViewController {
    
    var counter = 0
    var typeCounter = 0
    
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var tasbeh: UIImageView!
    @IBOutlet weak var segmentSebha: UISegmentedControl!
    @IBOutlet var progressCircle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tasbeh.isUserInteractionEnabled = true
        let tasbeh = UIGestureRecognizer(target: self, action: #selector(tapGestureRecognizerCounter))
        
    }
    
    @IBAction func tapGestureRecognizerCounter(_ sender: UITapGestureRecognizer) {
        
        if segmentSebha.selectedSegmentIndex == 0 {
            typeCounter = 10
            
            if counter == typeCounter {
                counter = 0
                labelCounter.text = String(counter)
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    generator.impactOccurred()
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    generator.impactOccurred()
                })
                
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                counter += 1
                labelCounter.text = String(counter)
            }
            
            
        } else if segmentSebha.selectedSegmentIndex == 1 {
            typeCounter = 33
            if counter == typeCounter {
                counter = 0
                labelCounter.text = String(counter)
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                counter += 1
                labelCounter.text = String(counter)
            }
            
            
        } else if segmentSebha.selectedSegmentIndex == 2 {
            typeCounter = 100
            if counter == typeCounter {
                counter = 0
                labelCounter.text = String(counter)
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                counter += 1
                labelCounter.text = String(counter)
            }
            
        } else if segmentSebha.selectedSegmentIndex == 3 {
            typeCounter = 1000
            if counter == typeCounter {
                counter = 0
                labelCounter.text = String(counter)
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                counter += 1
                labelCounter.text = String(counter)
            }
        } else {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            counter += 1
            labelCounter.text = String(counter)
        }
    }
    

    @IBAction func onChangeCounter(_ sender: Any) {
        counter = 0
        labelCounter.text = String(counter)
    }
}
