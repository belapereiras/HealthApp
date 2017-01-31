//
//  PopUpViewController.swift
//  DoNotSmokeApp
//
//  Created by Priscila Rosa on 1/30/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import UIKit


class PopUpViewController: UIViewController {
    
    lazy var imageReceived = UIImage()
    var textReceived = String()
    var titleReceived = String()

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpTitle: UILabel!
    @IBOutlet weak var popUpImage: UIImageView!
    @IBOutlet weak var popUpText: UILabel!
    
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
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.8
        self.popUpView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        
        popUpImage.image = imageReceived
        popUpTitle.text = titleReceived
        popUpText.text = textReceived
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
