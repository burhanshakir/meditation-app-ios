//
//  UserDefaultKeyNames.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 31/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import Foundation

struct UserDefaultKeyNames
{
    
    struct Settings
    {
        static let chakraCuningSetting = "Chakra Cuning Settings"
        static let sourceCodeSetting = "Source Code Settings"
        static let gspaceSetting = "G Space Settings"
    }
    
    struct LatestMeditation
    {
        static let meditationName = "Latest Meditation Name"
        static let meditationDescription = "Latest Meditation Description"
        static let meditationDate = "Latest Meditation Date"
        static let meditationStreak = "Latest Meditation Streak"
        
    }
    
    struct MeditationNames
    {
        static let basicChakra = "Basic Chakra Cuning"
        static let advChakra = "Advanced Chakra Cuning"
        static let sourceCode = "Source Code"
        static let gSpace = "G Space"
    }
    
    struct MeditationTime
    {
        static let totalMeditationTime = "Total Meditation time"
        static let time = "time"
        static let total = "total"
        static let chakraCuning = "Chakra Cuning"
        static let sourceCode = "Source Code"
        static let gSpace = "G Space"
    }
}
