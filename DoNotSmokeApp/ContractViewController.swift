//
//  ContractViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/22/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ContractViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
