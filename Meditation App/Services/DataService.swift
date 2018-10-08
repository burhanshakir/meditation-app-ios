//
//  DataService.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 26/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import Foundation

class DataService
{
    static let instance = DataService()
    
   //Basic Chakra Cuning Meditation data
    
    private let basicChakraCuning = [
        Meditation.init(title: "8th Chakra", imageName: "8thchakra", subMeditations: []),
        Meditation.init(title: "9th Chakra", imageName: "9thchakra", subMeditations: []),
        Meditation.init(title: "10th Chakra", imageName: "10thchakra", subMeditations: []),
        Meditation.init(title: "Base", imageName: "base", subMeditations: []),
        Meditation.init(title: "Empty Mind", imageName: "empty mind", subMeditations: []),
        Meditation.init(title: "Heart", imageName: "heart", subMeditations: []),
        Meditation.init(title: "Sacrum", imageName: "sacrum", subMeditations: []),
        Meditation.init(title: "Solarplex", imageName: "solarplex", subMeditations: []),
        Meditation.init(title: "Third Eye", imageName: "thirdeye", subMeditations: []),
        Meditation.init(title: "Throat", imageName: "throat", subMeditations: [])
    ]
    
    // Advanced Chakra Cuning Data
    
    private let advChakraCuning = [
        Meditation.init(title: "Base 10th", imageName: "base-10th", subMeditations: []),
        Meditation.init(title: "Heart Crown", imageName: "heart-crown", subMeditations: []),
        Meditation.init(title: "Sacrum 9th", imageName: "sacrum - 9th", subMeditations: []),
        Meditation.init(title: "Solarplex 8th", imageName: "solarplex - 8th", subMeditations: []),
        Meditation.init(title: "Throat Third Eye", imageName: "throat - third eye", subMeditations: []),
    
        ]
    
    // Souce Code data
    
    private let sourceCode = [
        Meditation.init(title: "Creating", imageName: "1-creation", subMeditations: []),
        Meditation.init(title: "Astral", imageName: "2-astral", subMeditations: []),
        Meditation.init(title: "Forward Thinking", imageName: "3-forwardthinking", subMeditations: []),
        Meditation.init(title: "Relationships", imageName: "4-relationships", subMeditations: []),
        Meditation.init(title: "Throat", imageName: "5-throat", subMeditations: []),
        Meditation.init(title: "Envy", imageName: "6-envy", subMeditations: []),
        Meditation.init(title: "Inner Strength", imageName: "7-innerstrength", subMeditations: []),
        Meditation.init(title: "Weight", imageName: "8-weight", subMeditations: []),
        Meditation.init(title: "Sacral", imageName: "9-sacral", subMeditations: []),
        Meditation.init(title: "Sexuality", imageName: "10-sexuality", subMeditations: []),
        Meditation.init(title: "Third Eye", imageName: "11-thirdeye", subMeditations: []),
        Meditation.init(title: "Solarplex", imageName: "12-solarplex", subMeditations: []),
        Meditation.init(title: "Vision", imageName: "13-vision", subMeditations: []),
        Meditation.init(title: "Whatif", imageName: "14-whatif", subMeditations: []),
        Meditation.init(title: "Release", imageName: "15-release", subMeditations: []),
        Meditation.init(title: "Pain", imageName: "16-pain", subMeditations: []),
        Meditation.init(title: "Manifest", imageName: "17-manifest", subMeditations: []),
        Meditation.init(title: "Anger", imageName: "18-anger", subMeditations: []),
        Meditation.init(title: "Skin", imageName: "19-skin", subMeditations: []),
        Meditation.init(title: "Love", imageName: "20-love", subMeditations: []),
        Meditation.init(title: "Language", imageName: "21-language", subMeditations: []),
        Meditation.init(title: "Joy", imageName: "22-joy", subMeditations: []),
        Meditation.init(title: "Heart", imageName: "23-heart", subMeditations: []),
        Meditation.init(title: "Psychedelic", imageName: "24-psychedelic", subMeditations: []),
        Meditation.init(title: "Physical", imageName: "25-physical", subMeditations: []),
        Meditation.init(title: "Guilt", imageName: "26-guilt", subMeditations: []),
        Meditation.init(title: "Energy", imageName: "27-energy", subMeditations: []),
        Meditation.init(title: "Definitive Thinking", imageName: "28-definitivethinking", subMeditations: []),
        Meditation.init(title: "Crown", imageName: "29-crown", subMeditations: []),
        Meditation.init(title: "Clarity", imageName: "30-clarity", subMeditations: []),
        Meditation.init(title: "Centeredness", imageName: "31-centeredness", subMeditations: []),
        Meditation.init(title: "Circulation", imageName: "32-circulation", subMeditations: []),
        Meditation.init(title: "Base", imageName: "33-base", subMeditations: []),
    ]
    
    // Meditations data will remain constant
    private lazy var meditations = [
        
        Meditation.init(title: "Basic Chakra Cuning", imageName: "basic-chakra.png",subMeditations: basicChakraCuning),
        
        Meditation.init(title: "Advanced Chakra Cuning", imageName: "adv-chakra.png",subMeditations: advChakraCuning),
        
        Meditation.init(title: "Source Code", imageName: "source-code.png",subMeditations: sourceCode),
        
        Meditation.init(title: "G Space", imageName: "g-space.png",subMeditations: [])
    ]
    
    
    
    
    //Meditation Instructions data
    
    private let instructions = [
        MeditationInstructions.init(name: "Basic Chakra", description: "Learn more about the proper way to use this powerful meditation system.", instruction: ""),
        
        MeditationInstructions.init(name: "Source Code", description: "Learn more about how to use these individual symbols for targetted inner work.", instruction: ""),
        
        MeditationInstructions.init(name: "G Space", description: "Learn more about our group meditation space", instruction: "")
    
    ]
    
    // Returning meditation data
    func getMeditations() -> [Meditation]
    {
        return meditations
    }
    
    
    func getMeditationInstructions() -> [MeditationInstructions]
    {
        return instructions
    }
    
    
    // Returns only 3 meditation types : Basic Chakra, Source Code, G Space
    func getBasicMeditations() -> [Meditation]
    {
        var basicMeditations = getMeditations()
        
        basicMeditations.remove(at: 1)
        
        return basicMeditations
    }
    
    
    func getLatestMeditation() -> [Meditation]
    {
        // TODO :- Check with local storage if any latest meditation was done
        let isLatestMeditationListExist = false
        
        if(!isLatestMeditationListExist)
        {
            return getBasicMeditations()
        }
        
    }
    
}
