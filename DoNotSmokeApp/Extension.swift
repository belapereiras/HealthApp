//
//  Extension.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/25/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func initialize_timer(with_interval interval: TimeInterval, handler: @escaping (Timer) -> ()) {
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: handler)
        timer.fire()
    }
}
