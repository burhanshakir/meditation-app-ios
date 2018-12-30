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
        
        
        // Changing the UI of label if words are more than 3
        let titleText = NSMutableString(string: meditation.title)
        titleText.insert(" ", at: 0)
        
        if meditation.title.contains("Basic")
        {
            titleText.insert("\n", at: 6)
        }
        else if meditation.title.contains("Advanced")
        {
            titleText.insert("\n", at: 9)
        }
        
        
        title.text = titleText as String
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
