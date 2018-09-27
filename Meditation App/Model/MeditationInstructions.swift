//
//  MeditationInstructions.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 27/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import Foundation

struct MeditationInstructions
{
    private(set) public var name : String!
    private(set) public var description : String!
    private(set) public var instruction : String!
    
    init(name : String, description : String, instruction : String)
    {
        self.name = name
        self.description = description
        self.instruction = instruction
    }
}
