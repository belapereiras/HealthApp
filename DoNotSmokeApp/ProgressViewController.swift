//
//  ProgressViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var notSmokingFor: UILabel!
    @IBOutlet var notSmokedCigarrettes: UILabel!
    @IBOutlet var unityOfTimeWithoutSmoking: UILabel!
    @IBOutlet var savedMoney: UILabel!
    var healthAchievement = HealthAchievement.getHASingleton()
    var user = User()
    var timer, timer2, timer3: dispatch_source_t!

    @IBOutlet var popUpBackground: UIView!
    @IBOutlet var popUp: UIView!
    @IBOutlet var popUpImage: UIImageView!
    @IBOutlet var popUpTitle: UILabel!
    @IBOutlet var popUpText: UILabel!

// MARK: ARRAYS
    
    var progressImages = [UIImage(named: "20minutesHeartGray"), UIImage(named: "2hoursHeartGray"), UIImage(named: "8hoursProgressGray"), UIImage(named: "12hoursProgressGray"), UIImage(named: "24hoursProgressGray"), UIImage(named: "48hoursProgressGray"), UIImage(named: "3daysProgressGray"), UIImage(named: "2to3weeksProgressGray"), UIImage(named: "1to9monthsProgressGray"), UIImage(named: "1yearProgressGray"), UIImage(named: "5yearsProgressGray"), UIImage(named: "10yearsProgressGray"), UIImage(named: "15yearsProgressGray")]
    
    
    var coloredProgressImages = [UIImage(named: "20minutesHeart"), UIImage(named: "2hoursHeart"), UIImage(named: "8hoursProgress"), UIImage(named: "12hoursProgress"), UIImage(named: "24hoursProgress"), UIImage(named: "48hoursProgress"), UIImage(named: "3daysProgress"), UIImage(named: "2to3weeksProgress"), UIImage(named: "1to9monthsProgress"), UIImage(named: "1yearProgress"), UIImage(named: "5yearsProgress"), UIImage(named: "10yearsProgress"), UIImage(named: "15yearsProgress")]
    
// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.progressImages.count
    }
    
// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ProgressCell
        
        cell.cellImage.image = self.coloredProgressImages[indexPath.row]
        cell.cellTitle.text = healthAchievement.healthBenefit[indexPath.row].name
        //cell.cellText.text = healthAchievement.healthBenefit[indexPath.row].description

        return cell
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){

        popUpTitle.text = healthAchievement.healthBenefit[indexPath.row].name
        popUpText.text = healthAchievement.healthBenefit[indexPath.row].description
        popUpImage.image = self.coloredProgressImages[indexPath.row]
        
        self.popUpBackground.hidden = false
        self.popUp.hidden = false
        self.popUpImage.hidden = false
        self.popUpTitle.hidden = false
        self.popUpText.hidden = false
        
        self.popUpBackground.alpha = 0
        self.popUp.alpha = 0
        self.popUpImage.alpha = 0
        self.popUpTitle.alpha = 0
        self.popUpText.alpha = 0
        
        UIView.animateWithDuration(0.3, delay: 0, options:
            UIViewAnimationOptions.CurveEaseOut, animations: {
                self.popUpBackground.alpha = 1.0
                self.popUp.alpha = 1.0
                self.popUpImage.alpha = 1.0
                self.popUpTitle.alpha = 1.0
                self.popUpText.alpha = 1.0
            }, completion: { finished in
                self.popUpBackground.hidden = false
                self.popUp.hidden = false
                self.popUpImage.hidden = false
                self.popUpTitle.hidden = false
                self.popUpText.hidden = false
        })
    }
    
    func updateNotSmokingTimeLabel() {
        let queue = dispatch_queue_create("com.domain.app.timer", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer) {
            guard let quitday = self.user?.quitDay else { return }
            guard var timeNotSmoking = self.user?.dateManager.timeSinceQuitDayInSeconds(quitday) else { return }
            var unity = "segundos"
            if timeNotSmoking < 2 {
                unity = "segundo"
            }
            if timeNotSmoking > 60 {
                timeNotSmoking = (self.user?.dateManager.timeSinceQuitDayInMinutes(quitday))!
                unity = "minutos"
                if timeNotSmoking < 2 {
                    unity = "minuto"
                } else {
                    unity = "minutos"
                }
                if timeNotSmoking > 60 {
                    timeNotSmoking = (self.user?.dateManager.timeSinceQuitDayInHours(quitday))!
                    if timeNotSmoking < 2 {
                        unity = "hora"
                    } else {
                        unity = "horas"
                    }
                    if timeNotSmoking > 24 {
                        timeNotSmoking = (self.user?.dateManager.timeSinceQuitDayInDays(quitday))!
                        if timeNotSmoking < 2 {
                            unity = "dia"
                        } else {
                            unity = "dias"
                        }
                        
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                let timeNotSmokingTrim = Int(timeNotSmoking)
                self.notSmokingFor.text = String(timeNotSmokingTrim)
                self.unityOfTimeWithoutSmoking.text = unity
            })
        }
        dispatch_resume(timer)
    }
    
    func updateMoneySavingsLabel() {
        let queue = dispatch_queue_create("com.domain.app.timer2", nil)
        timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer2, DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer2) {
            //if self.user?.dateManager.timeSinceQuitDayInDays((self.user?.quitDay)!) > 1 {
                guard let savings = self.user?.moneySavings() else { return }
            var savingString: String
                if savings < 0.0001 {
                    savingString = "0.00"
                } else {
                     savingString = self.trimNumbers(savings)
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.savedMoney.text = String(savingString)
                })
            //}
        }
        dispatch_resume(timer2)
    }
    
    func trimNumbers(number: Double) -> String {
        let numberString = String(number)
        print(numberString)
        let trimmedNumber: String
        if number >= 1000 {
            trimmedNumber = numberString.substringWithRange(numberString.startIndex..<numberString.startIndex.advancedBy(6))
        } else {
            trimmedNumber = numberString.substringWithRange(numberString.startIndex..<numberString.startIndex.advancedBy(4))
        }
        return trimmedNumber
    }
    
    func updateCigarettesNotSmokedLabel() {
        let queue = dispatch_queue_create("com.domain.app.timer3", nil)
        timer3 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer3, DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer3) {
            //if self.user?.dateManager.timeSinceQuitDayInDays((self.user?.quitDay)!) > 1 {
                guard let notSmokedCigarrette = self.user?.cigarettesNotSmoked() else { return }
                let notSmoked = Int(notSmokedCigarrette)
                dispatch_async(dispatch_get_main_queue(), {
                    self.notSmokedCigarrettes.text = String(notSmoked)
                })
            //}
        }
        dispatch_resume(timer3)
    }
    
//    func updateBenefitsAchieved() {
//        let queue = dispatch_queue_create("com.domain.app.timer4", nil)
//        timer4 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
//        dispatch_source_set_timer(timer4, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0)
//        dispatch_source_set_event_handler(timer4) {
//            guard let quitday = self.user?.quitDay else { return }
//            let timeNotSmoking = self.user!.dateManager.timeSinceQuitDayInSeconds(quitday)
//            if let benefitsAchieved = self.healthAchievement.benefitsAchieved(timeNotSmoking) {
//                self.adjustProgressImages(benefitsAchieved)
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.collectionView.reloadData()
//                })
//                
//            }
//        }
//        dispatch_resume(timer4)
//    }
//    
//    func adjustProgressImages(benefitsAchieved: [HealthBenefit]) {
//        let benefits = benefitsAchieved
//        for benefit in benefits {
//            let index = benefits.indexOf({ (b: HealthBenefit) -> Bool in return b.healthNumber == benefit.healthNumber })
//            
//            progressImages[index!] = coloredProgressImages[index!]
//        }
//        
//    }
    
    func notificate() {
        
        let benefits = healthAchievement.healthBenefit
        for benefit in benefits {
            let notification:UILocalNotification = UILocalNotification()
            let timeinterval = (user?.quitDay)! + benefit.completionTime!
            let date = NSDate(timeIntervalSinceReferenceDate: timeinterval)
            print("**** DATA \(date) ****")
            notification.alertAction = "Ver"
            notification.alertBody = String(date)
            notification.fireDate = date
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
        }
        
    }
    
    override func viewDidLoad() {
        updateNotSmokingTimeLabel()
        updateMoneySavingsLabel()
        updateCigarettesNotSmokedLabel()
        notificate()
        popUp.layer.cornerRadius = 20
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProgressViewController.handleTap(_:)))
        self.popUpBackground.addGestureRecognizer(tap)
    }
    
    func handleTap (sender: UIGestureRecognizer) {
        UIView.animateWithDuration(0.3, delay: 0, options:
            UIViewAnimationOptions.CurveEaseOut, animations: {
                self.popUpBackground.alpha = 0
                self.popUp.alpha = 0
                self.popUpImage.alpha = 0
                self.popUpTitle.alpha = 0
                self.popUpText.alpha = 0
            }, completion: { finished in
                self.popUpBackground.hidden = true
                self.popUp.hidden = true
                self.popUpImage.hidden = true
                self.popUpTitle.hidden = true
                self.popUpText.hidden = true
        })
    }
    
    @IBAction func longPressCell(sender: AnyObject) {
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
