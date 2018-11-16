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

class ReminderAlertBoxVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var repeatPickerView: UIPickerView!
    
    var delegate: ReminderAlertDelegate?
    var reminderText : String = "Repeat Daily"
    
    let pickerData : [String] = ["Repeat Daily","Repeat Weekly"]
    
    
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
        
        // Displaying 12 hour clock
        timePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale
        
        repeatPickerView.dataSource = self
        repeatPickerView.delegate = self
        
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
    
    
    // MARK:- IBAction Functions
    
    @IBAction func deleteButtonTapped(_ sender: Any)
    {
        delegate?.deleteButtonTapped()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any)
    {
        delegate?.cancelButtonTapped()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        // Getting time from time picker
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        delegate?.saveButtonTapped(selectedTime: "\(hour) : \(minute)", selectedRepeat: reminderText)
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:- PickerView Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        reminderText = pickerData[row]
    }

}
