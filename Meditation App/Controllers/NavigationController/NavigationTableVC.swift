//
//  NavigationTableVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 25/12/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class NavigationTableVC: UITableViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    // MARK: - Status bar and Top bar edit methods
    
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
