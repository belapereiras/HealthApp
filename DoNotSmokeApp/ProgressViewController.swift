//
//  ProgressViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var notSmokingFor: UILabel!
    @IBOutlet var notSmokedCigarrettes: UILabel!
   
    @IBOutlet var unityOfTimeWithoutSmoking: UILabel!
    
    @IBOutlet var savedMoney: UILabel!
    var healthAchievement = HealthAchievement.getHASingleton()
    var user = User()
    var timer: dispatch_source_t!
    

// MARK: ARRAYS
    
    var progressImages = [UIImage(named: "20minutesHeart"), UIImage(named: "2hoursHeart"), UIImage(named: "8hoursProgress"), UIImage(named: "12hoursProgress"), UIImage(named: "24hoursProgress"), UIImage(named: "48hoursProgress"), UIImage(named: "3daysProgress"), UIImage(named: "2to3weeksProgress"), UIImage(named: "1to9monthsProgress"), UIImage(named: "1yearProgress"), UIImage(named: "5yearsProgress"), UIImage(named: "10yearsProgress"), UIImage(named: "15yearsProgress")]
    
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
    
    func updateNotSmokingAndSavingsLabels() {
        let queue = dispatch_queue_create("com.domain.app.timer", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC) // every 60 seconds, with leeway of 1 second
        dispatch_source_set_event_handler(timer) {
            guard let plist = Plist(name: "UserPropertyList") else { print("DEU RUIIIM");return }
            guard let dic = plist.getValuesInPlistFile() else { print("DEU RUIIIM"); return }
            let quitDay = Double(dic["QuitDay"] as! NSNumber)
            guard let timeNotSmokingInMinutes = self.user?.dateManager.timeSinceQuitDayInMinutes(quitDay) else { return }
            print(timeNotSmokingInMinutes)
            dispatch_async(dispatch_get_main_queue(), {
                print("entrei2")
                self.unityOfTimeWithoutSmoking.text = String(timeNotSmokingInMinutes)
            })
        }
        dispatch_resume(timer)
    }
    
    override func viewDidLoad() {
        updateNotSmokingAndSavingsLabels()
    }
    
    
    
    

}
