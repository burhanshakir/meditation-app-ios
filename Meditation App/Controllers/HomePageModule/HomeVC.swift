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
    @IBOutlet weak var latestMeditationLabel: UILabel!
    @IBOutlet weak var latestMeditationDescLabel : UILabel!
    
    private var latestMeditations = [Meditation]()
    var latestMeditationName:String?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        latestMeditations = DataService.instance.getLatestMeditation()
        
        latestMediationCollectionView.delegate = self
        latestMediationCollectionView.dataSource = self
        
        setUpViews()
    }
    
    
    func setUpViews()
    {
        latestMeditationName = UserDefaults.standard.string(forKey: UserDefaultKeyNames.LatestMeditation.meditationName)
        
        let latestMeditationDescription = UserDefaults.standard.string(forKey: UserDefaultKeyNames.LatestMeditation.meditationDescription)
        
        if latestMeditationName != nil
        {
            latestMeditationLabel.text = latestMeditationName
            latestMeditationDescLabel.text = latestMeditationDescription
        }
    }
    
    
    // MARK:-  IBOutlets
    @IBAction func onStartNowPressed(_ sender: Any)
    {
        
        // Getting all meditations
        var meditations = [Meditation]()
        meditations = DataService.instance.getMeditations()
        
        // Initializing controller to be displayed
        let doMeditationVC = self.storyboard?.instantiateViewController(withIdentifier: "DoMeditationID") as! DoMeditationVC
        
        
        // Checking if any meditation is done
        
        if latestMeditationName != nil
        {
            // Sending Basic Chakra as default meditation
            
            if latestMeditationName == UserDefaultKeyNames.MeditationNames.basicChakra
            {
                //Getting Basic Chakra Meditations
                
                doMeditationVC.meditation = meditations[0]
                
            }
            
            else if latestMeditationName == UserDefaultKeyNames.MeditationNames.advChakra
            {
                //Getting Adv Chakra Meditations
                
                doMeditationVC.meditation = meditations[1]
            }
            
            else if latestMeditationName == UserDefaultKeyNames.MeditationNames.sourceCode
            {
                //Getting Source Code Meditations
                
                doMeditationVC.meditation = meditations[2]
            }
            
        }
        else
        {
            //Sending Basic Chakra as default meditation
            
            doMeditationVC.meditation = meditations[0]
        }
        
        self.present(doMeditationVC, animated: true, completion: nil)
    }
    
    
    // MARK:- Delegate methods
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        // Getting all meditations
        var meditations = [Meditation]()
        meditations = DataService.instance.getMeditations()
        var sourceCodeMeditation = meditations[2]
        
        // Initializing controller to be displayed
        let doMeditationVC = self.storyboard?.instantiateViewController(withIdentifier: "DoMeditationID") as! DoMeditationVC
        
        
        
        if indexPath.row == 0
        {
            sourceCodeMeditation.selectedMeditationIndex = 30
            doMeditationVC.meditation = sourceCodeMeditation
            self.present(doMeditationVC, animated: true, completion: nil)
        }
        
        else if indexPath.row == 1
        {
            sourceCodeMeditation.selectedMeditationIndex = 11
            doMeditationVC.meditation = sourceCodeMeditation
            self.present(doMeditationVC, animated: true, completion: nil)
        }
        
        else if indexPath.row == 2
        {
            sourceCodeMeditation.selectedMeditationIndex = 2
            doMeditationVC.meditation = sourceCodeMeditation
            self.present(doMeditationVC, animated: true, completion: nil)
        }
        
    }
    
}
