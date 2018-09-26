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
    
    // Meditation data will remain constant
    private let meditations = [
        
        Meditation.init(title: "Basic Chakra Cuning", imageName: "basic-chakra.png"),
        
        Meditation.init(title: "Advanced Chakra Cuning", imageName: "adv-chakra.png"),
        
        Meditation.init(title: "Source Code", imageName: "source-code.png"),
        
        Meditation.init(title: "G Space", imageName: "g-space.png")
    ]
    
    // Returning meditation data
    func getMeditations() -> [Meditation]
    {
        return meditations
    }
    
}
