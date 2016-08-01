//
//  AchievementsViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit



class AchievementsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
    
    var savePhotos = SavePhotos.getSPSingleton()

    var images:[UIImage] = []
    var titles:[String]!

    
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var stickersView: UIView!
    @IBOutlet var stickersCollectionView: UICollectionView!
    
    @IBOutlet var selfiesView: UIView!
    @IBOutlet var selfiesCollectionView: UICollectionView!
    
    @IBOutlet var popUpBackground: UIView!
    @IBOutlet var popUp: UIView!
    @IBOutlet var popUpImage: UIImageView!
    @IBOutlet var popUpText: UILabel!
    
    
    //var selfieImageReceiver = UIImage()

    
// MARK: ARRAYS
    
    var achievementsStickers = [UIImage(named: "20dias"), UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]
    
    
// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.stickersCollectionView {
        return self.achievementsStickers.count
        } else {
            return images.count
        }

    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView == self.stickersCollectionView {
        
        let cellStickers = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AchievementsCell
        
        cellStickers.cellImageStickers.image = self.achievementsStickers[indexPath.row]
        
        return cellStickers
        } else {

            let cellSelfies = collectionView.dequeueReusableCellWithReuseIdentifier("cell2", forIndexPath: indexPath) as! AchievementsCell
            cellSelfies.cellImageSelfies?.image = images[indexPath.row]
            cellSelfies.cellImageSelfies?.contentMode = .ScaleAspectFit
            
            return cellSelfies
        }
    }
    
// MARK: SELECT COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        popUpImage.image = self.achievementsStickers[indexPath.row]
        //popUpText.text =
        
        self.popUpBackground.hidden = false
        
        self.popUp.hidden = false
        
        self.popUpImage.hidden = false
        
        self.popUpText.hidden = false
        
        self.popUpBackground.alpha = 0
        
        self.popUp.alpha = 0
       
        self.popUpImage.alpha = 0
        
        self.popUpText.alpha = 0
        
        UIView.animateWithDuration(0.3, delay: 0, options:
            UIViewAnimationOptions.CurveEaseOut, animations: {
                
                self.popUpBackground.alpha = 1.0
                
                self.popUp.alpha = 1.0
                
                self.popUpImage.alpha = 1.0
                
                self.popUpText.alpha = 1.0
            
            }, completion: { finished in
                
                self.popUpBackground.hidden = false
                
                self.popUp.hidden = false
                
                self.popUpImage.hidden = false
                
                self.popUpText.hidden = false
        })
    }

    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    
//    
//    func refresh() {
//        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
//        let image = loadImageFromPath(savePhotos.imagesDirectoryPath)
//        images.append(image!)
//    }


    func refreshTable(){
        
        do {
            print (">>>>>>>ENTROU NO REFRESH<<<<<<<<<")
            images.removeAll()
            
            titles = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(savePhotos.imagesDirectoryPath)
            for image in titles {
                let data = NSFileManager.defaultManager().contentsAtPath(savePhotos.imagesDirectoryPath.stringByAppendingString("/\(image)"))
                if data != nil {
                    guard let image = UIImage(data: data!) else { break }
                    images.insert(image, atIndex: 0)
                }
            }
            self.selfiesCollectionView.reloadData()
        } catch {
            print("Error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        savePhotos.createImageFolder()
        
        selfiesCollectionView.reloadData()
        
        selfiesCollectionView.delegate = self
        stickersCollectionView.delegate = self
        
        selfiesCollectionView.dataSource = self
        stickersCollectionView.dataSource = self
        
        popUp.layer.cornerRadius = 20
        
        let tapOnBackground = UITapGestureRecognizer(target: self, action: #selector(ProgressViewController.handleTap(_:)))
        self.popUpBackground.addGestureRecognizer(tapOnBackground)

        refreshTable()

        selfiesView.hidden = true
    }

    func handleTap (sender: UIGestureRecognizer) {
        UIView.animateWithDuration(0.3, delay: 0, options:
            UIViewAnimationOptions.CurveEaseOut, animations: {
                
                self.popUpBackground.alpha = 0
                
                self.popUp.alpha = 0
                
                self.popUpImage.alpha = 0
                
                self.popUpText.alpha = 0
            
            }, completion: { finished in
                
                self.popUpBackground.hidden = true
                
                self.popUp.hidden = true
                
                self.popUpImage.hidden = true
                
                self.popUpText.hidden = true
        })
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
