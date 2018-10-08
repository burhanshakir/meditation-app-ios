//
//  SourceCodeMeditaionsVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 08/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class SubMeditationVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var subMeditationCollectionView : UICollectionView!
    
    public var meditation : Meditation!
    private var subMeditations : [Meditation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        subMeditations = meditation.subMeditations
        
        subMeditationCollectionView.delegate = self
        subMeditationCollectionView.dataSource = self
    }
    
    
    
    // MARK: - Collection View Delegate Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subMeditations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let meditationCell = subMeditationCollectionView.dequeueReusableCell(withReuseIdentifier: "SubMeditationCell", for: indexPath) as? SubMeditationCell
        {
            let meditation = subMeditations[indexPath.row]
            meditationCell.updateViews(meditation: meditation)
            
            return meditationCell
            
        }
        
        return MeditationCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let meditation = subMeditations[indexPath.row]
        self.performSegue(withIdentifier: "DoMeditationVC", sender: meditation)
    }
    

    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let doMeditationVC = segue.destination as? DoMeditationVC
        {
            assert(sender as? Meditation != nil)
            doMeditationVC.meditation = sender as? Meditation
            
        }
    }
 

}
