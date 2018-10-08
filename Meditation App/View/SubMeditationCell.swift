//
//  SubMeditationCell.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 09/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class SubMeditationCell: UICollectionViewCell
{
    
    @IBOutlet weak var meditationImage: UIImageView!
    @IBOutlet weak var meditationName: UILabel!
    
    // Setting meditation data
    func updateViews(meditation : Meditation)
    {
        meditationImage.image = UIImage(named: meditation.imageName)
        meditationName.text = meditation.title
    }
    
}
