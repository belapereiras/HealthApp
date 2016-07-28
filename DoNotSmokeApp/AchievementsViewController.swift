//
//  AchievementsViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit



class AchievementsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var stickersView: UIView!
    @IBOutlet var stickersCollectionView: UICollectionView!
    
    @IBOutlet var selfiesView: UIView!
    @IBOutlet var selfiesCollectionView: UICollectionView!
    
    //var selfieImageReceiver = UIImage()

    
// MARK: ARRAYS
    
    var achievementsStickers = [UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]
    
// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if stickersView.hidden == false {
//        return self.achievementsStickers.count
//        } else {
//            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
//            return images.count
//        }
        
        return self.achievementsStickers.count
    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AchievementsCell
        
        cell.cellImageStickers.image = self.achievementsStickers[indexPath.row]
        
        return cell
        
//        if selfiesView.hidden == false {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AchievementsCell
//        
//        cell.cellImageStickers.image = self.achievementsStickers[indexPath.row]
//        
//        return cell
//        } else {
//            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
//            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AchievementsCell
//
//            cell.cellImageSelfies?.image = vc.images[indexPath.row]
//
//            return cell
//        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadImages()

        // Do any additional setup after loading the view.
        selfiesView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeView(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selfiesView.hidden = true
            stickersView.hidden = false
        case 1:
            selfiesView.hidden = false
            stickersView.hidden = true
        default:
            break;
        }

    }
    
    @IBAction func openCamera(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            let selfiePicker = UIImagePickerController()
            selfiePicker.delegate = self
            selfiePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            selfiePicker.allowsEditing = false
            
            self.presentViewController(selfiePicker, animated: true, completion: nil)
        }

    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
        print(">>>>>>>>>>>ENTROU<<<<<<<<<<<<<")
        
        //selfieImageReceiver = pickedImage
        //self.dismissViewControllerAnimated(true, completion: nil)

        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
        print("VIEW CONTROLLER \(vc)")
        print("IMAGE \(pickedImage)")
        vc.selfieImage = pickedImage
        self.dismissViewControllerAnimated(true, completion: nil)

        self.presentViewController(vc, animated: true, completion: nil)
        }
    }
  
}
