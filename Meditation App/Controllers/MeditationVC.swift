//
//  MeditationVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 26/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class MeditationVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mediationCollectionView : UICollectionView!
    
    private var meditations = [Meditation]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        meditations = DataService.instance.getMeditations()
        
        mediationCollectionView.dataSource = self
        mediationCollectionView.delegate = self
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return meditations.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if let meditationCell = mediationCollectionView.dequeueReusableCell(withReuseIdentifier: "MeditationCell", for: indexPath) as? MeditationCell
        {
            let meditation = meditations[indexPath.row]
            meditationCell.updateViews(meditation: meditation)
            
            return meditationCell
            
        }
        
        return MeditationCell()
    }

}
