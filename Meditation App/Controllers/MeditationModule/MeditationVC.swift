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
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
            
            //Onclick of view button a segue is performed
            meditationCell.onStartButtonTapped = {
                
                // Chakra cuning meditaion users are directed to different screen
                if(meditation.title.contains("Chakra Cuning"))
                {
                    self.performSegue(withIdentifier: "DoMeditationVC", sender: meditation)
                }
                else if (meditation.title.contains("Source Code"))
                {
                    self.performSegue(withIdentifier: "SubMeditationVC", sender: meditation)
                }
                
            }
            
            return meditationCell
            
        }
        
        return MeditationCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let doMeditationVC = segue.destination as? DoMeditationVC
        {
            assert(sender as? Meditation != nil)
            doMeditationVC.meditation = sender as? Meditation
        
            
        }
        
        else if let subMeditationVC = segue.destination as? SubMeditationVC
        {
            assert(sender as? Meditation != nil)
            subMeditationVC.meditation = sender as? Meditation
        }
    }

}
