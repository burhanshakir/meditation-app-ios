//
//  Meditation.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 26/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import Foundation

// Struct model to store data for each meditation type
struct Meditation
{
    private(set) public var title : String!
    private(set) public var imageName : String!
    public var selectedMeditationIndex: Int!
    
    private(set) public var subMeditations : [Meditation]
    
    private(set) public var description : String!
    
    init(title : String, imageName : String, subMeditations : [Meditation], description : String)
    {
        self.title = title
        self.imageName = imageName
        self.subMeditations = subMeditations
        self.selectedMeditationIndex = 0
        self.description = description
    }
}
