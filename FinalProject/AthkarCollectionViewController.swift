//
//  AthkarCollectionViewController.swift
//  FinalProject
//
//  Created by mohammad.alsharif on 17/05/1443 AH.
//

import UIKit

private let reuseIdentifier = "Cell"

class AthkarCollectionViewController: UICollectionViewController {
    
    @IBOutlet var athkarCollection: UICollectionView!
    
    @IBOutlet weak var athkatTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        return cell
    }

}
