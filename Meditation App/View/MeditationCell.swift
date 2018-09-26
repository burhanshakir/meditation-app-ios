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
    
    // Setting meditation data
    func updateViews(meditation : Meditation)
    {
        meditationImage.image = UIImage(named: meditation.imageName)
        title.text = meditation.title
    }
    
}
