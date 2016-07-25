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

    }

    
    @IBAction func agreedContract(sender: AnyObject) {
    }
    
    
}
