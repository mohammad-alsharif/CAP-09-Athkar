//
//  Sebha.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 10/05/1443 AH.
//

import UIKit
import HGCircularSlider
import QuartzCore

class Sebha: UIViewController {
    
    var counter = 0
    var typeCounter = 0
    
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var segmentSebha: UISegmentedControl!
    @IBOutlet weak var viewCircularSlider: CircularSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCircularSlider.stopThumbAtMinMax = true
        viewCircularSlider.endThumbStrokeColor = .clear
        viewCircularSlider.endThumbStrokeHighlightedColor = .clear
        viewCircularSlider.endThumbTintColor = .clear
        
        viewCircularSlider.isUserInteractionEnabled = true
        let tasbeh = UIGestureRecognizer(target: self, action: #selector(tapGestureRecognizerCounter))
    }
    
    @IBAction func tapGestureRecognizerCounter(_ sender: UITapGestureRecognizer) {
        if segmentSebha.selectedSegmentIndex == 0 {
            typeCounter = 10
            viewCircularSlider.maximumValue = 0.0
            
            if counter == typeCounter {
                counter = 0
                counter += 1
                labelCounter.text = counter.description
                ten()
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
                counter += 1
                labelCounter.text = counter.description
                ten()
            }
            
            
        } else if segmentSebha.selectedSegmentIndex == 1 {
            typeCounter = 33
            
            if counter == typeCounter {
                counter = 0
                counter += 1
                labelCounter.text = counter.description
                thirtyThree()
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
                counter += 1
                labelCounter.text = counter.description
                thirtyThree()
            }
            
        } else if segmentSebha.selectedSegmentIndex == 2 {
            typeCounter = 100
            
            if counter == typeCounter {
                counter = 0
                counter += 1
                labelCounter.text = counter.description
                oneHundred()
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
                counter += 1
                labelCounter.text = counter.description
                oneHundred()
            }
            
            
        } else if segmentSebha.selectedSegmentIndex == 3 {
            typeCounter = 1000
            
            if counter == typeCounter {
                counter = 0
                counter += 1
                labelCounter.text = counter.description
                oneThousand()
                
            } else {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
                counter += 1
                labelCounter.text = counter.description
                oneThousand()
                
            }
            
            
        } else {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            
            
            
            counter += 1
            labelCounter.text = counter.description
            viewCircularSlider.maximumValue = 0.0
//            viewCircularSlider.thumbRadius = 0
//            viewCircularSlider.endThumbStrokeColor = view.backgroundColor!
        }
        
    }
    
    
    @IBAction func onChangeCounter(_ sender: UIButton) {
        counter = 0
        labelCounter.text = counter.description
        viewCircularSlider.maximumValue = 0.0
    }
    
    func ten() {
        viewCircularSlider.minimumValue = 0.0
        viewCircularSlider.maximumValue = 10.0
        self.viewCircularSlider.endPointValue = CGFloat(self.counter)
    }
    
    func thirtyThree() {
        viewCircularSlider.minimumValue = 0.0
        viewCircularSlider.maximumValue = 33.0
        self.viewCircularSlider.endPointValue = CGFloat(self.counter)
    }
    
    func oneHundred() {
        viewCircularSlider.minimumValue = 0.0
        viewCircularSlider.maximumValue = 100.0
        self.viewCircularSlider.endPointValue = CGFloat(self.counter)
    }
    
    func oneThousand() {
        viewCircularSlider.minimumValue = 0.0
        viewCircularSlider.maximumValue = 1000.0
        self.viewCircularSlider.endPointValue = CGFloat(self.counter)
    }
}
