//
//  MeditationInstructionVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 30/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class MeditationInstructionVC: UIViewController {
    
    public var meditation : MeditationInstructions!
    
    @IBOutlet weak var meditationName : UILabel!
    @IBOutlet weak var meditationInstructions : UILabel!
    @IBOutlet weak var scrollView : UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        meditationName.text = meditation.name
        meditationInstructions.text = meditation.instruction
        
        // TODO:- Instruction Not being displayed in full
    }
    
    

}
