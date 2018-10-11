//
//  DoMeditationVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 07/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit
import AVFoundation


class DoMeditationVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var meditationImage : UIImageView!
    
    public var meditation : Meditation!
    
    var meditationImageAsset : UIImage! = nil
    
    var isSongAllowed : Bool = true;
    var meditationSoundEffect: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        meditationImageAsset = UIImage(named: meditation.imageName)!
        
        //TODO :- Check for user defaults for meditation and display UI accordingly
        
        //Checks orientation and displays the correct image format
        checkForOrientation()
        
        // Add Gesture to dismiss image
        addSwipeGesture()
        
        //play song
        if isSongAllowed
        {
           playSong()
        }
        
    }
    
    // MARK :- Gestures
    
    func addSwipeGesture()
    {
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissScreen))
        swipe.direction = .down
        
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc func dismissScreen()
    {
        
        self.navigationController?.popViewController(animated: false)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK :- Meditation Image Display
    
    // On Orientation Changed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        checkForOrientation()
        
    }
    
    //TODO :- Check User Preference and display image accordingly
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
        
        setImage(image: result)

    }
    
    private func displayImageInLandscape()
    {
        //Displaying image as is
        setImage(image: meditationImageAsset)
    }
    
    private func setImage(image : UIImage)
    {
        self.meditationImage.image = image
        self.meditationImage.contentMode = .scaleAspectFill
    }
    
    // MARK :- Play Audio File
    
    private func playSong()
    {
        guard let url = Bundle.main.url(forResource: "spaceambientmix", withExtension: "mp3") else { return }
        
        do
        {
            meditationSoundEffect = try AVAudioPlayer(contentsOf: url)
            guard let meditationSound = meditationSoundEffect else { return }
            
            meditationSound.prepareToPlay()
            meditationSound.play()
        }
        catch let error
        {
            print(error.localizedDescription)
        }
    }


}