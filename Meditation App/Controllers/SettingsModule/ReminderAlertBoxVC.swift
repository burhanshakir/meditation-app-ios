//
//  ReminderAlertBoxVC.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 10/11/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import UIKit

protocol ReminderAlertDelegate : class
{
    func deleteButtonTapped()
    func cancelButtonTapped()
    func saveButtonTapped(selectedTime: String, selectedRepeat: String)
}

class ReminderAlertBoxVC: UIViewController
{

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var repeatPickerView: UIPickerView!
    
    var delegate: ReminderAlertDelegate?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setupView()
        animateView()
        
    }
    
    func setupView()
    {
        alertView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView()
    {
        alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: Any)
    {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any)
    {
        delegate?.cancelButtonTapped()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
