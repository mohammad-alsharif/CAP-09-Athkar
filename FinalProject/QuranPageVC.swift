//
//  QuranPageVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 27/05/1443 AH.
//

import UIKit
import PDFKit

class QuranPageVC: UIViewController {

    let pdfView = PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // constraint
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // reading pdf
        guard let path = Bundle.main.url(forResource: "Quran", withExtension: "pdf") else { return }
        
        if let document = PDFDocument(url: path) {
            pdfView.document = document
        }
    }
    
}
