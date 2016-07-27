//
//  AvailableStickersViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/27/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class AvailableStickersViewController: UIViewController {
    
    var selfieImage: UIImage?

    @IBOutlet var AvailableStickersCollectionView: UICollectionView!
    
    @IBOutlet var selfieImageView: UIImageView!
    
    var AvailableStickers = [UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]

// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.AvailableStickers.count
    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell3", forIndexPath: indexPath) as! AvailableStickersCell
        
        cell.cellImage.image = self.AvailableStickers[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //loadSelfieToImageView()
        guard let image = selfieImage else { return }
        selfieImageView.image = image
        
        

        // Do any additional setup after loading the view.
    }
//    
//    func loadSelfieToImageView() {
//        print ("LOADING IMAGE TO IMAGE VIEW")
//        let vc = AchievementsViewController()
//        selfieImage = vc.selfieImageReceiver
//        selfieImageView.image = selfieImage
//        selfieImageView.contentMode = .ScaleAspectFit
//        if selfieImageView.image == nil {
//            print ("TA NIL")
//        } else {
//            print ("NAO TA NIL")
//        }
//    }


    @IBAction func openCameraAgain(sender: AnyObject) {
    }
    
    @IBAction func cancelStickersCollage(sender: AnyObject) {
    }
    
    
    @IBAction func saveToCameraRoll(sender: AnyObject) {
    }
    
    @IBAction func mailShare(sender: AnyObject) {
    }
    
    @IBAction func twitterShare(sender: AnyObject) {
    }
    
    @IBAction func facebookShare(sender: AnyObject) {
    }
}
