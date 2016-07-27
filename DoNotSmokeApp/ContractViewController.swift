//
//  ContractViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/22/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ContractViewController: UIViewController {
    
// MARK: STORYBOARD
    
    @IBOutlet var smokerName: UITextField!
    @IBOutlet var nbrPerDay: UITextField!
    @IBOutlet var pricePerPack: UITextField!
    @IBOutlet var cigarettesPerPack: UITextField!
    @IBOutlet var helper1Mail: UITextField!
    @IBOutlet var helper2Mail: UITextField!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var mailButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func agreedContract(sender: AnyObject) {
        
        guard let plist = Plist(name: "UserPropertyList") else { return }
        guard let userDic = plist.getMutablePListFile() else { return }
        guard let pricePerPack = pricePerPack.text else { return }
        guard let cigarretesSmokerPerDay = nbrPerDay.text else { return }
        guard let cigarsPerPack = cigarettesPerPack.text else { return }
        
        userDic["Name"] = smokerName.text
        userDic["CigarettesPerPack"] = Int(cigarsPerPack)! as NSNumber
        userDic["CigarettesSmokedPerDay"] = Int(cigarretesSmokerPerDay)! as NSNumber
        userDic["QuitDay"] = NSDate().timeIntervalSinceReferenceDate as NSNumber
        userDic["PackPrice"] = Double(pricePerPack)! as NSNumber
        let firstTime = NSNumber.init(bool: false)
        userDic["FirstTime"] = firstTime
        
        do {
            try plist.addValuesToPlistFile(userDic)
        } catch {
            print(error)
        }
        
        performSegueWithIdentifier("contractToController", sender: sender)
        
    }
   
    @IBAction func FacebookAction(sender: AnyObject) {
        
        //performSegueWithIdentifier("contractToController", sender: sender)

    }
    
    
    @IBAction func TwitterAction(sender: AnyObject) {
    }
    
    
    @IBAction func MailAction(sender: AnyObject) {
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
    }
}
