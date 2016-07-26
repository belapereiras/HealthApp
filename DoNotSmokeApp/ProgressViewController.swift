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
    
// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.progressImages.count
    }
    
// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ProgressCell
        
        cell.cellImage.image = self.progressImages[indexPath.row]
        cell.cellTitle.text = healthAchievement.healthBenefit[indexPath.row].name
        //cell.cellText.text = healthAchievement.healthBenefit[indexPath.row].description

        return cell
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        popUpBackground.hidden = false
        popUp.hidden = false
        
        popUpImage.image = self.progressImages[indexPath.row]
        popUpImage.hidden = false
        
        popUpTitle.text = healthAchievement.healthBenefit[indexPath.row].name
        popUpTitle.hidden = false
        
        popUpText.text = healthAchievement.healthBenefit[indexPath.row].description
        popUpText.hidden = false
    }
    
    func updateNotSmokingTimeLabel() {
        let queue = dispatch_queue_create("com.domain.app.timer", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC)
        dispatch_source_set_event_handler(timer) {
            guard let quitday = self.user?.quitDay else { return }
            guard var timeNotSmoking = self.user?.dateManager.timeSinceQuitDayInMinutes(quitday) else { return }
            var unity = "minutos"
            if timeNotSmoking > 60 {
                timeNotSmoking = (self.user?.dateManager.timeSinceQuitDayInHours(quitday))!
                unity = "horas"
                if timeNotSmoking > 24 {
                    timeNotSmoking = (self.user?.dateManager.timeSinceQuitDayInDays(quitday))!
                    unity = "dias"
                    if timeNotSmoking > 30 {
                        timeNotSmoking = (self.user?.dateManager.timeSinceQuitDayInDays(quitday))!
                        unity = "meses"
                    }
                }
                
            }
            print(timeNotSmoking)
            dispatch_async(dispatch_get_main_queue(), {
                print("entrei2")
                self.notSmokingFor.text = String(timeNotSmoking)
                self.unityOfTimeWithoutSmoking.text = unity
            })
        }
        dispatch_resume(timer)
    }
    
    func updateMoneySavingsLabel() {
        let queue = dispatch_queue_create("com.domain.app.timer2", nil)
        timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer2, DISPATCH_TIME_NOW, 86400 * NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer2) {
            if self.user?.dateManager.timeSinceQuitDayInDays((self.user?.quitDay)!) > 1 {
                guard let savings = self.user?.moneySavings() else { return }
                dispatch_async(dispatch_get_main_queue(), {
                    print(savings)
                    self.savedMoney.text = String(savings)
                })
            }
        }
        dispatch_resume(timer2)
    }
    
    func updateCigarettesNotSmokedLabel() {
        let queue = dispatch_queue_create("com.domain.app.timer3", nil)
        timer3 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer3, DISPATCH_TIME_NOW, 86400 * NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer3) {
            if self.user?.dateManager.timeSinceQuitDayInDays((self.user?.quitDay)!) > 1 {
                guard let notSmokedCigarrette = self.user?.cigarettesNotSmoked() else { return }
                dispatch_async(dispatch_get_main_queue(), {
                    self.notSmokedCigarrettes.text = String(notSmokedCigarrette)
                })
            }
        }
        dispatch_resume(timer3)
        
    }
    
    override func viewDidLoad() {
        updateNotSmokingTimeLabel()
        updateMoneySavingsLabel()
        updateCigarettesNotSmokedLabel()
        
        popUp.layer.cornerRadius = 20
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProgressViewController.handleTap(_:)))
        self.popUpBackground.addGestureRecognizer(tap)
    }
    
    func handleTap (sender: UIGestureRecognizer) {
        popUpBackground.hidden = true
        popUp.hidden = true
        popUpImage.hidden = true
        popUpTitle.hidden = true
        popUpText.hidden = true
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
