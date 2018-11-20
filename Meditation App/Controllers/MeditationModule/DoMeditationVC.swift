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
    var meditationSetting : String!
    
    var isSongAllowed : Bool = true;
    var meditationSoundEffect: AVAudioPlayer?
    
    // Default timer for Chakra Cuning meditations
    var timer = 120
    
    // Default value for landscape settings
    var isLandscapeLockEnabled = false
    
    // Selected Meditation of Image
    var selectedMeditationIndex = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        meditationImageAsset = UIImage(named: meditation.subMeditations[meditation.selectedMeditationIndex].imageName)!
        
        loadSettings()
        
        // Add Gesture to dismiss image
        addSwipeGesture()
        
        // TODO:- Show next and previous button on Source Code Meditations
        
        
        
    }
    
    // MARK:- Load settings
    func loadSettings()
    {
        if(meditation.title.contains("Chakra Cuning"))
        {
            meditationSetting = UserDefaultKeyNames.Settings.chakraCuningSetting
        }
        else if(meditation.title.contains("Source Code"))
        {
            meditationSetting = UserDefaultKeyNames.Settings.sourceCodeSetting
        }
        else
        {
            meditationSetting = UserDefaultKeyNames.Settings.gspaceSetting
        }
        
        var settings = UserDefaults.standard.dictionary(forKey: meditationSetting)
        
        if(settings != nil)
        {
            if (settings!["music"] as! Bool)
            {
                playSong()
            }
            
            if(settings!["landscape"] as! Bool)
            {
                isLandscapeLockEnabled = true
                
            }
            else
            {
                isLandscapeLockEnabled = false

            }
            
            displayImageBasedOnSetting()
            
            if(meditationSetting == UserDefaultKeyNames.Settings.chakraCuningSetting)
            {
                timer = settings!["timer"] as! Int
                
                
                var _ = Timer.scheduledTimer(timeInterval: TimeInterval(timer), target: self, selector: #selector(DoMeditationVC.changeImageBasedOnTimer), userInfo: nil, repeats: true)
                }
        }
        else // If no settings present set everything as default
        {
            // Music will be played by default
            playSong()
            
            // Orientation will be checked by default
            checkForOrientation()
        }
    }
    
    
    // MARK:- Gestures
    
    func addSwipeGesture()
    {
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissScreen))
        swipe.direction = .down
        
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc func dismissScreen()
    {
        // Stopping song
        stopSong()
        
        // Adding animation
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        
        
        self.navigationController?.popViewController(animated: false)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    // MARK:- Meditation Image Display
    
    private func displayImageBasedOnSetting()
    {
        if(isLandscapeLockEnabled)
        {
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            displayImageInLandscape()
        }
        else
        {
            checkForOrientation()
        }
    }
    
    override var shouldAutorotate: Bool {
        if(isLandscapeLockEnabled)
        {
            return true
        }
        return false
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if(isLandscapeLockEnabled)
        {
            return .landscapeLeft
        }
        
        return .portrait
        
    }
    
    
    // On Orientation Changed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        displayImageBasedOnSetting()
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
    
    // TODO:- The half part of image is not being displayed
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
        
        UIView.transition(with: self.meditationImage,
                          duration: 0.75,
                          options: .transitionCrossDissolve,
                          animations: { self.meditationImage.image = image },
                          completion: nil)
        self.meditationImage.contentMode = .scaleAspectFill
    }
    
    // Only for Chakra Cuning Meditations
    // TODO:- Question: What happens after reaching the final image ?
    // TODO :- App crashes after reaching the last image
    @objc private func changeImageBasedOnTimer()
    {
        if(selectedMeditationIndex < meditation.subMeditations.count)
        {
            meditationImageAsset = UIImage(named: meditation.subMeditations[selectedMeditationIndex].imageName)!
            
            displayImageBasedOnSetting()
            
            selectedMeditationIndex = selectedMeditationIndex + 1
            
        }
    }
    
    // MARK:- Play Audio File
    
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
        
    private func stopSong()
    {
        if(meditationSoundEffect != nil)
        {
            meditationSoundEffect?.stop()
        }
    }
    // TODO:- Add watery animation on the meditation screen


}
