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
    @IBOutlet weak var homeBtn : UIButton!
    @IBOutlet weak var nextBtn : UIButton!
    @IBOutlet weak var muteBtn : UIButton!
    
    public var meditation : Meditation!
    
    var meditationImageAsset : UIImage! = nil
    var meditationSetting : String!
    
    var isSongAllowed : Bool = true;
    var meditationSoundEffect: AVAudioPlayer?
    
    // Default timer for Chakra Cuning meditations
    var timer = 120
    
    // Default value for landscape settings
    var isLandscapeLockEnabled = true
    
    // Selected Meditation of Image
    var selectedMeditationIndex = 0
    var meditationTime : Date!
    
    var isButtonsDisplayed : Bool = false
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        meditationTime = Date()
        
        meditationImageAsset = UIImage(named: meditation.subMeditations[meditation.selectedMeditationIndex].imageName)!
        
        
        loadSettings()
        
        // Add Gesture to dismiss image
        addGestures()
        
        //Storing latest meditation
        storeLatestMeditationUserDefaults()
        
        // TODO:- Show next and home button on Source Code Meditations
        
        
        
    }

    
    // MARK:- Loading and saving settings
    
    func storeLatestMeditationUserDefaults()
    {
        // Setting latest meditation name
        UserDefaults.standard.set(meditation.title, forKey: UserDefaultKeyNames.LatestMeditation.meditationName)
        
        // Setting latest meditation desc
        UserDefaults.standard.set(meditation.description, forKey: UserDefaultKeyNames.LatestMeditation.meditationDescription)
        
        
        // Storing Meditation Streak
        let todaysDate = Date()
        
        var lastMeditationDate = UserDefaults.standard.object(forKey: UserDefaultKeyNames.LatestMeditation.meditationDate) as? Date
        
        var meditationStreak = UserDefaults.standard.integer(forKey: UserDefaultKeyNames.LatestMeditation.meditationStreak)
        
        
        if lastMeditationDate != nil
        {
            // Checking if the meditation dates are consecutive
            
            let diff = todaysDate.interval(ofComponent: .day, fromDate: lastMeditationDate!)
            
            // If dates are consecutive, increase the counter else set the counter to 1
            if diff == 1
            {
                meditationStreak = meditationStreak + 1
            }
            else
            {
                meditationStreak = 1
            }
        }
        else
        {
            // Storing the counter for the first time
            meditationStreak = 1
        }
        
        lastMeditationDate = todaysDate
        
        // Storing the latest values for streak
        
        UserDefaults.standard.set(lastMeditationDate, forKey: UserDefaultKeyNames.LatestMeditation.meditationDate)
        UserDefaults.standard.set(meditationStreak, forKey: UserDefaultKeyNames.LatestMeditation.meditationStreak)
        
        
    }
    
    
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
            else
            {
                muteBtn.isHidden = true
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
    
    func storeMeditationTime(timeDone : TimeInterval)
    {
        //Storing time
        
        var meditationTimeUserDefaults = [String : Any]()
        
        if(UserDefaults.standard.dictionary(forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime) != nil)
        {
            meditationTimeUserDefaults = UserDefaults.standard.dictionary(forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime)!
        }
        
        
        var totalMeditationTime: TimeInterval = timeDone
        
        if(meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.time] != nil)
        {
            totalMeditationTime = totalMeditationTime.advanced(by: meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.time] as! TimeInterval)
        }
        
        meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.time] = totalMeditationTime
        
        
        // Storing frequency
        var totalMeditationDone = 1
        
        if(meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.total] != nil)
        {
            totalMeditationDone = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.total] as! Int + 1
        }
        
        meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.total] = totalMeditationDone
        
        
        //Storing count for meditation type
        if(meditationSetting.contains("Cuning"))
        {
            let count : Int? = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.chakraCuning] as? Int ?? 0
            
            
            meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.chakraCuning] = count! + 1
            
            
        }
        
        else if(meditationSetting.contains("Space"))
        {
            let count : Int? = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.gSpace] as? Int ?? 0
            
            
            meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.gSpace] = count! + 1
            
        }
        
        else
        {
            
            let count : Int? = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.sourceCode] as? Int ?? 0
            
            
            meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.sourceCode] = count! + 1
            
        }
        
        
        UserDefaults.standard.set(meditationTimeUserDefaults, forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime)
        
    }
    
    
    // MARK:- Gestures
    
    func addGestures()
    {
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissScreen))
        swipe.direction = .down
        
        self.view.addGestureRecognizer(swipe)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        meditationImage.isUserInteractionEnabled = true
        meditationImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped()
    {
        
        if(isButtonsDisplayed)
        {
            homeBtn.isHidden = true
            nextBtn.isHidden = true
        }
        else
        {
            homeBtn.isHidden = false
            
            // Show next button only if more images are left
            
            if(selectedMeditationIndex < meditation.subMeditations.count - 1)
            {
                nextBtn.isHidden = false
            }
            
        }
        
        isButtonsDisplayed = !isButtonsDisplayed

    }
    
    @objc func dismissScreen()
    {
        // Stopping song
        stopSong()
        
        let meditationEnd = Date()
        
        let executionTime = meditationEnd.timeIntervalSince(meditationTime)
        
        
        // Storing time of meditation
        storeMeditationTime(timeDone: executionTime)
        
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
    
    // MARK:- IBActions
    
    
    @IBAction func homePressed(_ sender: Any)
    {
        dismissScreen()
    }
    
    
    @IBAction func nextPressed(_ sender: Any)
    {
        changeImageBasedOnTimer()
    }
    
    
    @IBAction func muteBtnPressed(_ sender: Any)
    {
        stopSong()
        muteBtn.isHidden = true
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
        
        setImage(image: result, orientation: "portrait")

    }
    
    private func displayImageInLandscape()
    {
        //Displaying image as is
        setImage(image: meditationImageAsset, orientation: "landscape")
    }
    
    private func setImage(image : UIImage, orientation : String)
    {
        
        // Resizing image based on screen size
        let resizedImage = image.resizeImageWith(viewSize: meditationImage.frame.size, orientation: orientation)
        
        UIView.transition(with: self.meditationImage,
                          duration: 0.75,
                          options: .transitionCrossDissolve,
                          animations: { self.meditationImage.image = resizedImage },
                          completion: nil)
    }
    
    // Only for Chakra Cuning Meditations
    // TODO:- Question: What happens after reaching the final image ?
    @objc private func changeImageBasedOnTimer()
    {
        if(selectedMeditationIndex < meditation.subMeditations.count - 1)
        {
            meditationImageAsset = UIImage(named: meditation.subMeditations[selectedMeditationIndex+1].imageName)!
            
            displayImageBasedOnSetting()
            
            selectedMeditationIndex = selectedMeditationIndex + 1
            
        }
        else
        {
            dismissScreen()
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
