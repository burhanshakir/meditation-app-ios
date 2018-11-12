//
//  ShowTimerVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 01/11/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class ShowTimerVC: UIViewController {

    @IBOutlet weak var timerPicker: UIDatePicker!
    var delegate: TimerReceiveDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpTimer()
        
        
    }
    
    // MARK : - UI changes to timer
    func setUpTimer()
    {
        
        timerPicker.countDownDuration = 60.0
        // Change time picker text color
        timerPicker.setValue(UIColor.white, forKey: "textColor")
    }
    
    // MARK : - IBOutlets
    
    @IBAction func cancelPressed(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: false)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: Any)
    {
        print(timerPicker.countDownDuration)
        
        if delegate != nil
        {
            delegate?.setTimerValue(seconds: Int(timerPicker!.countDownDuration))
            dismiss(animated: true, completion: nil)
        }
        
    }
    

}
