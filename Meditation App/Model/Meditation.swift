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
    
    init(title : String, imageName : String)
    {
        self.title = title
        self.imageName = imageName
    }
}
