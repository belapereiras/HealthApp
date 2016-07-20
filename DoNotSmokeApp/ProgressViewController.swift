//
//  ProgressViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    
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
    
        return cell
    }

    

    

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
