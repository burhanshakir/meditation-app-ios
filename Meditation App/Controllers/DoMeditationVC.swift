//
//  DoMeditationVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 07/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class DoMeditationVC: UIViewController {
    
    @IBOutlet weak var meditationImage : UIImageView!
    let meditationImageAsset : UIImage = UIImage(named:"heart-crown")!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Checks orientation and displays the correct image format
        checkForOrientation()
        
    }
    
    // On Orientation Changed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        checkForOrientation()
        
    }
    
    private func checkForOrientation()
    {
        if UIDevice.current.orientation.isLandscape
        {
            displayImageInLandscape()
        }
        else
        {
            displayImageInPortrait()
        }
    }
    
    private func displayImageInPortrait()
    {
        
       let imageSizeForPortrait = CGRect(x: 0.0, y: 0.0, width: meditationImageAsset.size.width, height: meditationImageAsset.size.height * 2)
        
        var cgImageMeditation = meditationImageAsset.cgImage
        cgImageMeditation = cgImageMeditation?.cropping(to: imageSizeForPortrait)
        
        let result: UIImage = UIImage(cgImage: cgImageMeditation!, scale: 0.0, orientation: meditationImageAsset.imageOrientation)
        
        self.meditationImage.image = result
        self.meditationImage.contentMode = .scaleAspectFill

    }
    
    private func displayImageInLandscape()
    {
        self.meditationImage.image = meditationImageAsset
        self.meditationImage.contentMode = .scaleAspectFill
    }


}
