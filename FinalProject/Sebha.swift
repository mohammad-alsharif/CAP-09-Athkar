//
//  Sebha.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 10/05/1443 AH.
//

import UIKit
import CircleProgressBar
import QuartzCore

class Sebha: UIViewController {
    
    let lblCounter: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var counter = 0
    var typeCounter = 0
    
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var segmentSebha: UISegmentedControl!
    
    let shapeCircleProgress = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        let theLayer = CAShapeLayer()
        let circleProgrress = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
//        view.layer.addSublayer(shapeCircleProgress)
        
        theLayer.path = circleProgrress.cgPath
        theLayer.strokeColor = UIColor.lightGray.cgColor
        theLayer.lineWidth = 10
        //        theLayer.fillColor = UIColor.clear.cgColor
//                theLayer.lineCap = kCAlineCapRound
//        view.layer.addSublayer(theLayer)
        
//        let circleProgrress = UIBezierPath(arcCenter: center, radius: 150, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
//        view.layer.addSublayer(shapeCircleProgress)
        
        shapeCircleProgress.path = circleProgrress.cgPath
        shapeCircleProgress.strokeColor = UIColor.yellow.cgColor
        shapeCircleProgress.lineWidth = 10
//        shapeCircleProgress.fillColor = UIColor.clear.cgColor
//        shapeCircleProgress.lineCap = kCAlineCapRound
        shapeCircleProgress.strokeEnd = 0
        
        
        
        view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(tapGestureCounter)))
        // tapGestureRecognizerCounter
    }
    
    @objc func tapGestureCounter() {
        print("H")
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
//        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        shapeCircleProgress.add(animation, forKey: "urSoBasic")
        
        
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
