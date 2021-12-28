//
//  AthkarCollectionVC.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 20/05/1443 AH.
//

import Foundation
import UIKit

class AthkarCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        return pageControl
    }()
    
    var arrayAthkar = [")(({قُلْ هُوَ اللَّهُ أَحَدٌ * اللَّهُ الصَّمَدُ * لَمْ يَلِدْ وَلَمْ يُولَدْ * وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ} : { قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ * مِنْ شَرِّ مَا خَلَقَ * وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ * وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ * وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ} . : {قُلْ أَعُوذُ بِرَبِّ النَّاسِ * مَلِكِ النَّاسِ * إِلَهِ النَّاسِ * مِنْ شَرِّ الْوَسْوَاسِ الـْخَنَّاسِ * الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ * مِنَ الْـجِنَّةِ وَالنَّاسِ} ثلاث مرات))( ).",""]
    
    @IBOutlet weak var collectionViewAthkar : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pageControl)
        
        collectionViewAthkar.register(UINib(nibName: "AthkarCollectionPage", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionViewAthkar.delegate = self
        collectionViewAthkar.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height-100, width: view.frame.size.width-20, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayAthkar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AthkarCollectionPage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width , height: collectionView.frame.size.height)
    }
    
}
