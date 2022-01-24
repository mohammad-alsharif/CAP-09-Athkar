//
//  SettingsVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 14/05/1443 AH.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var switsh: UISwitch!
    @IBOutlet weak var lblchangeValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func switshChangeValue(_ sender: Any) {
        if switsh.isOn{
            lblchangeValue.text = "إلغاء تفعيل الوضع الليلي"
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
            
        }else{
            lblchangeValue.text = "تفعيل الوضع الليلي"
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .unspecified
            }
            
        }
        
    }
    
    
}
