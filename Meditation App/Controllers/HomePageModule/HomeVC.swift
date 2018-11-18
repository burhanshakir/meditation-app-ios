//
//  HomeVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 27/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var latestMediationCollectionView : UICollectionView!
    
    private var latestMeditations = [Meditation]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        latestMeditations = DataService.instance.getLatestMeditation()
        
        latestMediationCollectionView.delegate = self
        latestMediationCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestMeditations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let meditationCell = latestMediationCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentMeditationCell", for: indexPath) as? LatestMeditationCell
        {
            let meditation = latestMeditations[indexPath.row]
            meditationCell.updateViews(meditation: meditation)
            
            return meditationCell
            
        }
        
        return LatestMeditationCell()

    }
    
}
