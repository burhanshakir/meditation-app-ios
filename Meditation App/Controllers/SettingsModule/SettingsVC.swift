//
//  SettingsVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 13/10/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var bgImg: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews()
    {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 851)
//        bgImg.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: 10)
    }


}
