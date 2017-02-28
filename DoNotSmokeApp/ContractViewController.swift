//
//  ContractViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/22/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit
import Social
import UserNotifications

class ContractViewController: UIViewController {
    
// MARK: STORYBOARD
    
    @IBOutlet var smokerName: UITextField!
    @IBOutlet var nbrPerDay: UITextField!
    @IBOutlet var pricePerPack: UITextField!
    @IBOutlet var cigarettesPerPack: UITextField!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet weak var agreedOutlet: UIButton!
    var sm_service: SocialMediaService!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        sm_service = SocialMediaService(vc: self)
        
        agreedOutlet.layer.cornerRadius = 30
    }
    
    @IBAction func agreedContract(_ sender: AnyObject) {
        
        guard let name = smokerName.text else { return }
        if name == "" {
            self.showAlert(title: "Campo vazio", msg: "Você deve ter um nome!", actionButton: "OK")
            return
        }
        guard let plist = Plist(name: "UserPropertyList") else { return }
        guard let userDic = plist.getMutablePListFile() else { return }
        guard let cigarretesSmokerPerDay = Int(nbrPerDay.text!) else {
            self.showAlert(title: "Valor inválido", msg: "Campo de cigarros fumados por dia deve ser preenchido com um número.", actionButton: "OK")
            return
        }
        guard let pricePerPack = Double(pricePerPack.text!) else {
            self.showAlert(title: "Valor inválido", msg: "Campo de preço do maço deve ser preenchido com um número.", actionButton: "OK")
            return
        }
        guard let cigarsPerPack = Int(cigarettesPerPack.text!) else {
            self.showAlert(title: "Valor inválido", msg: "Campo de cigarros fumados por dia deve ser preenchido com um número.", actionButton: "OK")
            return
        }
        
        userDic["Name"] = name
        userDic["CigarettesPerPack"] = cigarsPerPack as NSNumber
        userDic["CigarettesSmokedPerDay"] = cigarretesSmokerPerDay as NSNumber
        userDic["QuitDay"] = Date().timeIntervalSinceReferenceDate as NSNumber
        userDic["PackPrice"] = pricePerPack as NSNumber
        let firstTime = NSNumber.init(value: false as Bool)
        userDic["FirstTime"] = firstTime
        do {
            try plist.addValuesToPlistFile(userDic)
        } catch {
            print(error)
        }
        
        Notifications.service.check()
        let user = User.getUserSingleton()
        user.healthAchievements.benefits.forEach{
            Notifications.schedule($0.title, $0.description, $0.completion_parameter)
        }
        
        user.moneyAchievements.benefits.forEach{
            let time_interval = user.moneyAchievements.convert_money_for_time(cost: $0.completion_parameter)
            print("Time_interval", time_interval)
            Notifications.schedule("Sticker Novo!", $0.title, time_interval)
        }
        performSegue(withIdentifier: "contractToController", sender: sender)

    }
   
    @IBAction func FacebookAction(_ sender: AnyObject) {
        sm_service.facebook_share(with_image: nil, and_text: "A partir de hoje, sou um ex-fumante! #StickWithMeApp")
    }
    
    
    @IBAction func TwitterAction(_ sender: AnyObject) {
        sm_service.twitter_share(with_image: nil, and_text: "A partir de hoje, sou um ex-fumante! #StickWithMeApp")
    }

}

extension UIViewController {
    func showAlert(title: String, msg: String, actionButton: String
        ){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: actionButton , style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
