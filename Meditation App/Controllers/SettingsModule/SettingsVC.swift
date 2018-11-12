//
//  SettingsVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 13/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

// Adding protocal to receive data from the next VC
protocol TimerReceiveDelegate
{
    func setTimerValue(seconds :Int)
}

class SettingsVC: UIViewController, TimerReceiveDelegate, ReminderAlertDelegate
{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var chakraCuningTab: UIControl!
    @IBOutlet weak var sourceCodeTab: UIControl!
    @IBOutlet weak var gspaceTab: UIControl!
    
    @IBOutlet weak var timerBtn: UIButton!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var landscapeSwitch: UISwitch!
    @IBOutlet weak var setTimerLbl: UILabel!
    @IBOutlet weak var optimizeLblTopConstraint: NSLayoutConstraint!
    
    // By default chakra cuning settings selected
    var settingForMeditation : String = UserDefaultKeyNames.Settings.chakraCuningSetting
    
    // By default seconds are 120
    var timerSeconds : Int = 120
    
    // Setting up scroll view
    override func viewDidLayoutSubviews()
    {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 750)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    
    // MARK:- IBAction Functions
    @IBAction func chakraCuningPressed(_ sender: Any)
    {
        settingForMeditation = UserDefaultKeyNames.Settings.chakraCuningSetting
        handleColorChange(forTab: "chakraCuning")
        doHideTimer(boolean: false)
    }
    
    @IBAction func sourceCodePressed(_ sender: Any)
    {
        settingForMeditation = UserDefaultKeyNames.Settings.sourceCodeSetting
        handleColorChange(forTab: "sourceCode")
        doHideTimer(boolean: true)
    }
    
    @IBAction func gspacePressed(_ sender: Any)
    {
        settingForMeditation = UserDefaultKeyNames.Settings.gspaceSetting
        handleColorChange(forTab: "gSpace")
        doHideTimer(boolean: true)
    }
    
    
    @IBAction func settingsSavePressed(_ sender: Any)
    {
        var settings = [String : Any]()
        
        if(settingForMeditation == UserDefaultKeyNames.Settings.chakraCuningSetting)
        {
            settings.updateValue(timerSeconds, forKey: "timer")
        }
        
        settings.updateValue(musicSwitch.isOn, forKey: "music")
        settings.updateValue(landscapeSwitch.isOn, forKey: "landscape")
        settings.updateValue(reminderSwitch.isOn, forKey: "reminder")
        
        UserDefaults.standard.set(settings, forKey: settingForMeditation)
        
        print("\(UserDefaults.standard.value(forKey: settingForMeditation)!)")
        
    }
    
    @IBAction func timerPressed(_ sender: Any)
    {
        self.performSegue(withIdentifier: "ShowTimerVC", sender: nil)
    }
    
    @IBAction func musicSwitchPressed(_ sender: Any)
    {
        
    }
    
    @IBAction func reminderSwitchPressed(_ sender: Any)
    {
        print("Music switch Pressed")
        
        let reminderAlert = self.storyboard?.instantiateViewController(withIdentifier: "ReminderAlertID") as! ReminderAlertBoxVC
        
        reminderAlert.providesPresentationContextTransitionStyle = true
        reminderAlert.definesPresentationContext = true
        reminderAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        reminderAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        reminderAlert.delegate = self
        self.present(reminderAlert, animated: true, completion: nil)
    }
    
    @IBAction func landscapeSwitchPressed(_ sender: Any)
    {
        
    }
    
    
    
    // MARK:- UI Changes for tab changes
    
    func handleColorChange(forTab tabName : String)
    {
        switch tabName
        {
            case "chakraCuning":
                print("Chakra Cuning")
            
                chakraCuningTab.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.631372549, blue: 1, alpha: 1)
                sourceCodeTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                gspaceTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            case "sourceCode":
                print("Source Code")
            
                chakraCuningTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                sourceCodeTab.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.631372549, blue: 1, alpha: 1)
                gspaceTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            case "gSpace":
                print("G Space")
            
                chakraCuningTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                sourceCodeTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                gspaceTab.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.631372549, blue: 1, alpha: 1)
            
            default:
                print("No tabs chosen")
        }
    }
    
    func doHideTimer(boolean : Bool)
    {
        // If timer is hidden change constraints and scroll size
        if boolean
        {
            optimizeLblTopConstraint.constant = 20
            scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 620)
            
        }
        else
        {
            optimizeLblTopConstraint.constant = 145
            scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 750)
        }
        
        // Changing constraints with animations
        UIView.animate(withDuration: 0.5)
        {
            self.scrollView.layoutIfNeeded()
        }
        
        setTimerLbl.isHidden = boolean
        timerBtn.isHidden = boolean
        
    }
    
    // MARK: - Delegate Methods
    
    // Sends data from set timer screen
    func setTimerValue(seconds :Int)
    {
        print("Data Received")
        timerSeconds = seconds
        let time = secondsToText(seconds: timerSeconds)
        timerBtn.setAttributedTitle(time, for: .normal)
        
    }
    
    // Sends actions of alert view when reminder alert box is being used
    func deleteButtonTapped()
    {
        print("Delete Button tapped")
    }
    
    func cancelButtonTapped()
    {
        print("Cancel Button tapped")
    }
    
    func saveButtonTapped(selectedTime: String, selectedRepeat: String)
    {
        print("Save Button tapped")
    }
    
    
    
    // MARK:- Helper Functions
    
    // Returns time in seconds as an attributed text to be displayed on button
    func secondsToText(seconds :Int) -> NSMutableAttributedString
    {
        let sec = numberToString(num: (seconds % 3600) % 60)
        let mins = numberToString(num: (seconds % 3600) / 60)
        let hours = numberToString(num: seconds / 3600)
        
        let secText = stringToAttributedString(frontString: sec, backString: "S")
        let minText = stringToAttributedString(frontString: mins, backString: "M")
        let hourText = stringToAttributedString(frontString: hours, backString: "H")
        let colonText = NSMutableAttributedString(string:":")
        
        let result = NSMutableAttributedString()
        result.append(hourText)
        result.append(colonText)
        result.append(minText)
        result.append(colonText)
        result.append(secText)
        
        return result
    }
    
    // Appends a 0 to the start of number if less than 10
    func numberToString(num : Int) -> String
    {
        if num < 10
        {
            return "0\(num)"
        }
         return "\(num)"
    }
    
    // Adding customized 'H', 'M' or 'S' to timer value
    func stringToAttributedString(frontString : String, backString : String) -> NSMutableAttributedString
    {
        let attributedString = NSMutableAttributedString(string:frontString)
        
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12.0)]
        
        let attrBackString = NSMutableAttributedString(string:backString, attributes:attrs)
        
        let result = NSMutableAttributedString()
        result.append(attributedString)
        result.append(attrBackString)
        
        return result
        

    }
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let setTimerVC = segue.destination as? ShowTimerVC
        {
            setTimerVC.delegate = self
            
        }
    }
}
