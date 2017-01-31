//
//  ProgressViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate{
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var notSmokingFor: UILabel!
    @IBOutlet var notSmokedCigarrettes: UILabel!
    @IBOutlet var unityOfTimeWithoutSmoking: UILabel!
    @IBOutlet var savedMoney: UILabel!
    
    var healthAchievement = HealthAchievement.getHASingleton()
    var user = User.getUserSingleton()
    var benefitsAchieved: [Benefit] = []
    
    private var popupIsOpen = false


// MARK: ARRAYS
    
    lazy var progressImages = [UIImage(named: "20minutesHeartGray"), UIImage(named: "2hoursHeartGray"), UIImage(named: "8hoursProgressGray"), UIImage(named: "12hoursProgressGray"), UIImage(named: "24hoursProgressGray"), UIImage(named: "48hoursProgressGray"), UIImage(named: "3daysProgressGray"), UIImage(named: "2to3weeksProgressGray"), UIImage(named: "1to9monthsProgressGray"), UIImage(named: "1yearProgressGray"), UIImage(named: "5yearsProgressGray"), UIImage(named: "10yearsProgressGray"), UIImage(named: "15yearsProgressGray")]
    
    
    lazy var coloredProgressImages = [UIImage(named: "20minutesHeart"), UIImage(named: "2hoursHeart"), UIImage(named: "8hoursProgress"), UIImage(named: "12hoursProgress"), UIImage(named: "24hoursProgress"), UIImage(named: "48hoursProgress"), UIImage(named: "3daysProgress"), UIImage(named: "2to3weeksProgress"), UIImage(named: "1to9monthsProgress"), UIImage(named: "1yearProgress"), UIImage(named: "5yearsProgress"), UIImage(named: "10yearsProgress"), UIImage(named: "15yearsProgress")]
    
// MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.progressImages.count
    }
    
// MARK: COLLECTION VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProgressCell
        if benefitsAchieved.count > 0 && benefitsAchieved.endIndex > indexPath.row {
            let benefitAchieved = benefitsAchieved[indexPath.row]
            cell.cellImage.image = self.coloredProgressImages[indexPath.row]
            cell.cellTitle.text = benefitAchieved.title
        } else {
            cell.cellImage.image = self.progressImages[indexPath.row]
            cell.cellTitle.text = healthAchievement.benefits[indexPath.row].title
        }

        return cell
    }
    
// MARK: SELECT COLLECTION VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("ENTROU")
        guard let imageToPass = self.coloredProgressImages[indexPath.row] else { return }
        let titleToPass = healthAchievement.benefits[indexPath.row].title
        let textToPass = healthAchievement.benefits[indexPath.row].description

        
        presentPopUp(image: imageToPass, title: titleToPass, text: textToPass)
//        popUpTitle.text = healthAchievement.benefits[indexPath.row].title
//        popUpText.text = healthAchievement.benefits[indexPath.row].description
//        popUpImage.image = self.coloredProgressImages[indexPath.row]
        
    }

    
// MARK: POP UP METHODS
    
    private func presentPopUp(image: UIImage, title: String, text: String) {
        
        popupIsOpen = true
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVC") as! PopUpViewController

        popUpVC.imageReceived = image
        popUpVC.titleReceived = title
        popUpVC.textReceived = text
        
        self.addChildViewController(popUpVC)
        
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        
        popUpVC.didMove(toParentViewController: self)
        
    }
    
    private func dismissPopUp() {
        
        let popUp = self.childViewControllers.first
        
        UIView.animate(withDuration: 0.25, animations: {
            popUp?.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            popUp?.view.alpha = 0
        }, completion: { (isFinished) in
                        
            if isFinished{
                popUp?.willMove(toParentViewController: self)
                popUp?.view.removeFromSuperview()
                popUp?.removeFromParentViewController()
                            
            }
        })
    }
    
    func popUpViewControllerDidSelect(value: String) {
        
    }
    
    func notificate() {
        
        let benefits = healthAchievement.benefits
        for benefit in benefits {
            let notification:UILocalNotification = UILocalNotification()
            let timeinterval = (user.quitDay) + benefit.completion_parameter
            let date = Date(timeIntervalSinceReferenceDate: timeinterval)
            notification.alertAction = "Ver"
            notification.alertBody = benefit.description
            notification.fireDate = date
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
    
    override func viewDidLoad() {
        initialize_timer(with_interval: 1, handler: updateNotSmokingTimeLabel)
        initialize_timer(with_interval: 5, handler: updateMoneySavingsLabel)
        initialize_timer(with_interval: 1, handler: updateCigarettesNotSmokedLabel)
        initialize_timer(with_interval: 5, handler: updateBenefitsAchieved)
        notificate()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProgressViewController.handleTap(_:)))
        tap.cancelsTouchesInView = false
        super.view.addGestureRecognizer(tap)
    }
    
    func handleTap (_ sender: UIGestureRecognizer) {
        if popupIsOpen {
            dismissPopUp()
            popupIsOpen = false
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func goToSelfieView(_ sender: AnyObject) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func longPressCell(_ sender: AnyObject) {
//        if sender.state == .Began {
//            print ("começou long")
//            let p = sender.locationInView(self.collectionView)
//            if let indexPath : NSIndexPath = (self.collectionView?.indexPathForItemAtPoint(p))!{
//                
//                popUpBackground.hidden = false
//                popUp.hidden = false
//                
//                popUpImage.image = self.progressImages[indexPath.row]
//                popUpImage.hidden = false
//                
//                popUpTitle.text = healthAchievement.healthBenefit[indexPath.row].name
//                popUpTitle.hidden = false
//                
//                popUpText.text = healthAchievement.healthBenefit[indexPath.row].description
//                popUpText.hidden = false
//                
//            }
//        } else if sender.state == .Ended {
//            print ("acabou")
//            popUpBackground.hidden = true
//            popUp.hidden = true
//            popUpImage.hidden = true
//            popUpTitle.hidden = true
//            popUpText.hidden = true
//        }
//        
    }
}

extension UIViewController {
    func initialize_timer(with_interval interval: TimeInterval, handler: @escaping (Timer) -> ()) {
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: handler)
        timer.fire()
    }
}

extension ProgressViewController {
    
    func updateNotSmokingTimeLabel(timer: Timer) {
            let quit_day = self.user.quitDay
            let time_not_smoking = self.user.dateManager.stringfyed_timeSince(quit_day)
            DispatchQueue.main.async {
                self.notSmokingFor.text = time_not_smoking.0
                self.unityOfTimeWithoutSmoking.text = time_not_smoking.1
            }
    }
    
    func updateMoneySavingsLabel(timer: Timer) {
            let savings = self.user.savings
            let savings_string = (savings == 0 || savings < 0.0001) ? "0.00" : self.trimNumbers(savings)
            DispatchQueue.main.async {
                self.savedMoney.text = savings_string
            }
    }
    
    func updateCigarettesNotSmokedLabel(timer: Timer) {
        let notSmokedCigarette = self.user.cigarettes_not_smoked
        let notSmoked = Int(notSmokedCigarette)
        DispatchQueue.main.async(execute: {
            self.notSmokedCigarrettes.text = String(notSmoked)
        })
    }
    
    func updateBenefitsAchieved(timer: Timer) {
        guard let timeNotSmoking = self.user.dateManager.tp_in_seconds else {fatalError("User must have time passed in seconds")}
        if let benefits = self.healthAchievement.benefits_achieved(timeNotSmoking) {
            self.benefitsAchieved = benefits
            DispatchQueue.main.async(execute: {
                self.collectionView.reloadData()
            })
        }
    }
    
    func trimNumbers(_ number: Double) -> String {
        let numberString = String(number)
        print(numberString)
        let trimmedNumber: String
        if number >= 1000 {
            trimmedNumber = numberString.substring(with: numberString.startIndex..<numberString.characters.index(numberString.startIndex, offsetBy: 6, limitedBy: numberString.endIndex)!)
        } else {
            trimmedNumber = numberString.substring(with: numberString.startIndex..<numberString.characters.index(numberString.startIndex, offsetBy: 4, limitedBy: numberString.endIndex)!)
        }
        return trimmedNumber
    }
    
}
