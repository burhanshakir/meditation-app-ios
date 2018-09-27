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
    
    // Meditations data will remain constant
    private let meditations = [
        
        Meditation.init(title: "Basic Chakra Cuning", imageName: "basic-chakra.png"),
        
        Meditation.init(title: "Advanced Chakra Cuning", imageName: "adv-chakra.png"),
        
        Meditation.init(title: "Source Code", imageName: "source-code.png"),
        
        Meditation.init(title: "G Space", imageName: "g-space.png")
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
    
}
