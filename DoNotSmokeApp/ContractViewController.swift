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
    
    @IBOutlet var nbrPerPack: UITextField!
    
    
    @IBOutlet var helper1Name: UITextField!
    
    @IBOutlet var helper1Mail: UITextField!
    
    
    @IBOutlet var helper2Name: UITextField!
    
    @IBOutlet var helper2Mail: UITextField!
    
    
    @IBOutlet var facebookButton: UIButton!
    
    @IBOutlet var twitterButton: UIButton!
    
    @IBOutlet var mailButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
// MARK: LANDSCAPE MODE ONLY

        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        ContractViewController.attemptRotationToDeviceOrientation()

    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.LandscapeLeft
    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
