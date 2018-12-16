//
//  AppUtility.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 18/11/18.
//  Copyright © 2018 meditation-app. All rights reserved.
// Use for changing orientation of the view controllers

import Foundation
import UIKit

struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask)
    {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate
        {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
    static func getAvgTime() -> Int
    {
        var meditationTimeUserDefaults = [String : Any]()
        
        if(UserDefaults.standard.dictionary(forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime) != nil)
        {
            meditationTimeUserDefaults = UserDefaults.standard.dictionary(forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime)!
            
            let time:TimeInterval = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.time] as! TimeInterval
            
            
            let total:Int = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.total] as! Int
            
            let avgTime = Int(time)/(total)
            
            return avgTime
        }
        
        return 0
    }
    
    static func getAvgTimeInString(forTime time : Int) -> String
    {
        
        let sec = (time % 3600) % 60
        let mins = (time % 3600) / 60
        
        let secString = String(format: "%02d", sec) // returns "00"
        let minsString = String(format: "%02d", mins)
        
        return "\(minsString):\(secString) mins"
    }
    
    static func getMostMeditated() -> String
    {
        var meditationTimeUserDefaults = [String : Any]()
        
        if(UserDefaults.standard.dictionary(forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime) != nil)
        {
            meditationTimeUserDefaults = UserDefaults.standard.dictionary(forKey: UserDefaultKeyNames.MeditationTime.totalMeditationTime)!
            
            let chakraCount : Int = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.chakraCuning] as? Int ?? 0
            
            let gspaceCount : Int = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.gSpace] as? Int ?? 0
            
            let sourceCodeCount : Int = meditationTimeUserDefaults[UserDefaultKeyNames.MeditationTime.sourceCode] as? Int ?? 0
            
            
            if(chakraCount >= gspaceCount && chakraCount >= sourceCodeCount)
            {
                return "Chakra Cuning"
            }
            
            else if(gspaceCount >= chakraCount && gspaceCount >= sourceCodeCount)
            {
                return "G Space"
            }
            
            else
            {
                return "Source Code"
            }
        }
        
        return "Chakra Cuning"
    }
    
}
