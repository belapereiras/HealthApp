//
//  PopUpStickersViewController.swift
//  DoNotSmokeApp
//
//  Created by Priscila Rosa on 2/16/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import UIKit

class PopUpStickersViewController: UIViewController {

    lazy var ppStickersImageReceived = UIImage()
    var ppStickersTextReceived = String()
    
    @IBOutlet weak var popUpStickersView: UIView!
    @IBOutlet weak var ppStickersLabel: UILabel!
    @IBOutlet weak var ppStickersImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        showAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupView() {
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.popUpStickersView.layer.cornerRadius = 5
        self.popUpStickersView.layer.shadowOpacity = 0.8
        self.popUpStickersView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        
        ppStickersImage.image = ppStickersImageReceived
        ppStickersLabel.text = ppStickersTextReceived
    }
    

    func showAnimation() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func removeAnimation() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0
        }) { (finished) in
            if finished {
                self.view.removeFromSuperview()
            }
        }
    }
}
