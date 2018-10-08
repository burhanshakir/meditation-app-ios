//
//  MeditationCellCollectionViewCell.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 26/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class MeditationCell: UICollectionViewCell {
    
    @IBOutlet weak var meditationImage : UIImageView!
    @IBOutlet weak var title : UILabel!
    
    var onStartButtonTapped : (() -> Void)? = nil
    
    // Setting meditation data
    func updateViews(meditation : Meditation)
    {
        meditationImage.image = UIImage(named: meditation.imageName)
        title.text = meditation.title
    }
    
    // Onclick listener directing click handle to View Controller
    @IBAction func onButtonPressed(_ sender: Any)
    {
        if let onStartButtonTapped = self.onStartButtonTapped
        {
            onStartButtonTapped()
        }
        
    }
    
}
