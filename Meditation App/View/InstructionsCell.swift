//
//  InstructionsCell.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 27/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class InstructionsCell: UITableViewCell {
    
    @IBOutlet weak var meditationName : UILabel!
    @IBOutlet weak var meditationDescription : UILabel!

    // Setting instruction data
    func updateViews(instructions : MeditationInstructions)
    {
        meditationName.text = instructions.name
        meditationDescription.text = instructions.description
    }

}
