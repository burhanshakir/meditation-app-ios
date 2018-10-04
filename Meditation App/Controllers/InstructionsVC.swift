//
//  InstructionsVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 27/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class InstructionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var instructionsTable:UITableView!
    
    private var instructions = [MeditationInstructions]()
    let cellHeaderHeight: CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        instructions = DataService.instance.getMeditationInstructions()
        
        instructionsTable.delegate = self
        instructionsTable.dataSource = self
        
        
    }
    
    // MARK: - Status bar and Top bar edit methods
    
//    // Changing status bar color to white
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Table View delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return instructions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return cellHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225 // default height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: cellHeaderHeight))

        headerView.backgroundColor = UIColor.clear
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let instructionsCell = instructionsTable.dequeueReusableCell(withIdentifier: "InstructionsCell", for: indexPath) as? InstructionsCell{
            
            let instruction = instructions[indexPath.section]
            instructionsCell.updateViews(instructions: instruction)
            
            //Onclick of view button a segue is performed
            instructionsCell.onViewButtonTapped = {
                self.performSegue(withIdentifier: "MeditationInstructionVC", sender: instruction)
            }
            
            return instructionsCell
            
        }
        return InstructionsCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let instructionVC = segue.destination as? MeditationInstructionVC
        {
            assert(sender as? MeditationInstructions != nil)
            instructionVC.meditation = sender as? MeditationInstructions
            
        }
    }


}
