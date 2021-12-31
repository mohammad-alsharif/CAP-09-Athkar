//
//  QuranVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 24/05/1443 AH.
//

import UIKit


class QuranVC: UIViewController {
    
    var quranArray = ["ahmad", "mohammad", "Ramez", "Khaled"]
    
    @IBOutlet weak var quranCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quranCollectionView.delegate = self
        quranCollectionView.dataSource = self
        quranCollectionView.register(UINib(nibName: "QuranCollectionCell", bundle: nil), forCellWithReuseIdentifier: "QuranCollectionCell")
    }
    
}

extension QuranVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quranArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuranCollectionCell", for: indexPath) as! QuranCollectionCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSize(width: 100.0, height: 100.0)
        
        return CGSize(width: (collectionView.bounds.width) , height: (collectionView.bounds.height))
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    
}
