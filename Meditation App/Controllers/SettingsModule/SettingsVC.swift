//
//  SettingsVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 13/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController
{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var chakraCuningTab: UIControl!
    @IBOutlet weak var sourceCodeTab: UIControl!
    @IBOutlet weak var gspaceTab: UIControl!
    
    @IBOutlet weak var setTimerLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var optimizeLblTopConstraint: NSLayoutConstraint!
    
    // By default chakra cuning settings selected
    var settingForMeditation : String = UserDefaultKeyNames.Settings.chakraCuningSetting
    
    // Setting up scroll view
    override func viewDidLayoutSubviews()
    {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 750)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    // MARK :- IBAction Functions
    @IBAction func chakraCuningPressed(_ sender: Any)
    {
        handleColorChange(forTab: "chakraCuning")
        doHideTimer(boolean: false)
    }
    
    @IBAction func sourceCodePressed(_ sender: Any)
    {
        handleColorChange(forTab: "sourceCode")
        doHideTimer(boolean: true)
    }
    
    @IBAction func gspacePressed(_ sender: Any)
    {
        handleColorChange(forTab: "gSpace")
        doHideTimer(boolean: true)
    }
    
    @IBAction func settingsSavePressed(_ sender: Any)
    {
        
    }
    
    // MARK :- UI Changes for tab changes
    func handleColorChange(forTab tabName : String)
    {
        switch tabName
        {
            case "chakraCuning":
                print("Chakra Cuning")
            
                chakraCuningTab.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.631372549, blue: 1, alpha: 1)
                sourceCodeTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                gspaceTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            case "sourceCode":
                print("Source Code")
            
                chakraCuningTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                sourceCodeTab.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.631372549, blue: 1, alpha: 1)
                gspaceTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            case "gSpace":
                print("G Space")
            
                chakraCuningTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                sourceCodeTab.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                gspaceTab.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.631372549, blue: 1, alpha: 1)
            
            default:
                print("No tabs chosen")
        }
    }
    
    func doHideTimer(boolean : Bool)
    {
        setTimerLbl.isHidden = boolean
        timerLbl.isHidden = boolean
        
        // If timer is hidden change constraints and scroll size
        if boolean
        {
            optimizeLblTopConstraint.constant = 20
            scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 620)
            
        }
        else
        {
            optimizeLblTopConstraint.constant = 145
            scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 750)
        }
        
        scrollView.layoutIfNeeded()
    }
    
}
