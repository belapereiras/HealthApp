//
//  FirstScreenViewController.swift
//  DoNotSmokeApp
//
//  Created by Priscila Rosa on 2/10/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var pulmaoAnimationView: PulmaoCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pulmaoAnimationView.addPulmao()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
