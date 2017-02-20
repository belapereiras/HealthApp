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
            datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: UIControlEvents.valueChanged)

        }
    }

    func setupView() {
        
        guard let plist = Plist(name: "UserPropertyList") else { return }
        guard let userDic = plist.getMutablePListFile() else { return }
        
        let name = userDic["Name"] as! String
        let cigarettes = String(describing: userDic["CigarettesSmokedPerDay"]!)
        let price = String(describing: userDic["PackPrice"]!)
        let perPack = String(describing: userDic["CigarettesPerPack"]!)
        
        nameTextField.text = name
        cigarettesPerDayTextField.text = cigarettes
        priceTextField.text = price
        cigarettesPerPackTextField.text = perPack
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let plist = Plist(name: "UserPropertyList") else { return }
        guard let userDic = plist.getMutablePListFile() else { return }
        guard let pricePerPack = priceTextField.text else { return }
        guard let cigarretesSmokerPerDay = cigarettesPerDayTextField.text else { return }
        guard let cigarsPerPack = cigarettesPerPackTextField.text else { return }
        
        if textField == nameTextField {
            userDic["Name"] = nameTextField.text
        }
        
        if textField == cigarettesPerDayTextField {
            userDic["CigarettesSmokedPerDay"] = Int(cigarretesSmokerPerDay)! as NSNumber
        }
        
        if textField == priceTextField {
            userDic["PackPrice"] = Double(pricePerPack)! as NSNumber
        }
        
        if textField == cigarettesPerPackTextField {
            userDic["CigarettesPerPack"] = Int(cigarsPerPack)! as NSNumber
        }
        
        do {
            try plist.addValuesToPlistFile(userDic)
        } catch {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
