//
//  AvailableStickersViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/27/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class AvailableStickersViewController: UIViewController, UICollectionViewDelegate {
    
    var selfieImage: UIImage?
    var stickerPicked: UIImage?
    @IBOutlet var AvailableStickersCollectionView: UICollectionView!
    @IBOutlet var selfieImageView: UIImageView!
    
    var availableStickers = [UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]

// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.availableStickers.count
    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell3", forIndexPath: indexPath) as! AvailableStickersCell
        
        cell.cellImage.image = self.availableStickers[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        stickerPicked = availableStickers[indexPath.row]
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //loadSelfieToImageView()
        guard let image = selfieImage else { return }
        selfieImageView.image = image
        selfieImageView.contentMode = .ScaleAspectFit
        
        

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
    
    @IBAction func tapGestureHandler(sender: AnyObject) {
    }
    
    func mergeStickerAndSelfie(point: CGPoint) -> UIImage? {
        
        guard let userImage = selfieImageView.image else {
            print("ERROR")
            return nil
        }
        guard let stickerImage = stickerPicked else {
            print("ERROR")
            return nil
        }
        let size = CGSizeMake(userImage.size.width, userImage.size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let selfieRect = CGRect(origin: CGPointZero, size: size)
        
        let stickerSize = CGSizeMake(stickerImage.size.width, stickerImage.size.height)
        let stickerRect = CGRect(origin: point, size: stickerSize)

        userImage.drawInRect(selfieRect)
        stickerImage.drawInRect(stickerRect)
        
        let mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return mergedImage
    }
    
//    func mergeImages (image1: UIImage, image2: UIImage) -> UIImage {
//        
//        let size = CGSizeMake(image1.size.width, image1.size.height);
//        
//        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//        
//        let imageRect = CGRect(origin: CGPointZero, size: size)
//        
//        image1.drawInRect(imageRect)
//        image2.drawInRect(CGRect(x: CGRectGetMidX(imageRect) - (image2.size.width * 4 / 2.0), y: CGRectGetMidY(imageRect) - (image2.size.height * 4 / 2.0), width: image2.size.width * 4, height: image2.size.height * 4))
//        
//        let imageToSave = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return imageToSave
//        
//    }
    
}
