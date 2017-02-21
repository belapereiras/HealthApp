//
//  SettingsViewController.swift
//  DoNotSmokeApp
//
//  Created by Priscila Rosa on 2/7/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cigarettesPerDayTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var cigarettesPerPackTextField: UITextField!
    @IBOutlet weak var stopDayTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        setupView()
        
        stopDayTextField.delegate = self
        nameTextField.delegate = self
        cigarettesPerDayTextField.delegate = self
        priceTextField.delegate = self
        cigarettesPerPackTextField.delegate = self
        
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.dateFormat = "dd MMM yyy"
        stopDayTextField.text = formatter.string(from: sender.date)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == stopDayTextField {
            
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date
            textField.inputView = datePicker
            datePicker.locale = Locale(identifier: "pt_BR")
            datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: UIControlEvents.valueChanged)

        }
    }

    func setupView() {
        
        let user = User.getUserSingleton()
        
        let name = user.name
        let cigarettes = String(describing: user.cigarettesPerDay)
        let price = String(describing: user.packPrice)
        let perPack = String(describing: user.cigarettesPerPack)
        let quitDay = user.quitDay

        nameTextField.text = name
        cigarettesPerDayTextField.text = cigarettes
        priceTextField.text = price
        cigarettesPerPackTextField.text = perPack
        stopDayTextField.text = quitDay.toDay
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let user = User.getUserSingleton()
        guard let plist = Plist(name: "UserPropertyList") else { return }
        guard let userDic = plist.getMutablePListFile() else { return }

        guard let pricePerPack = priceTextField.text else { return }
        guard let cigarretesSmokedPerDay = cigarettesPerDayTextField.text else { return }
        guard let cigarsPerPack = cigarettesPerPackTextField.text else { return }
        
        if textField == nameTextField {
            userDic["Name"] = nameTextField.text
        }
        
        if textField == cigarettesPerDayTextField {
            userDic["CigarettesSmokedPerDay"] = Double(cigarretesSmokedPerDay)! as NSNumber
        }
        
        if textField == priceTextField {
            userDic["PackPrice"] = Double(pricePerPack)! as NSNumber
        }
        
        if textField == cigarettesPerPackTextField {
            userDic["CigarettesPerPack"] = Double(cigarsPerPack)! as NSNumber
        }
        
        if textField == stopDayTextField {
            let manager = DateManager()
            let interval = manager.stringToDate(timeString: stopDayTextField.text!)
            userDic["QuitDay"] = interval
        }
        
        do {
            try plist.addValuesToPlistFile(userDic)
        } catch {
            print(error)
        }

        user.set_user_properties()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
