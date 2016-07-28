//
//  AchievementsViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit



class AchievementsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    var images:[UIImage] = []
    var titles:[String]!

    
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
        
        if collectionView == self.stickersCollectionView {
        return self.achievementsStickers.count
        } else {
//            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
            return imagesGamb.count
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

            cellSelfies.cellImageSelfies?.image = imagesGamb[indexPath.row]

            return cellSelfies
        }
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    
    
    func refresh() {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
        let image = loadImageFromPath(vc.imagesDirectoryPath)
        images.append(image!)
    }


    func refreshTable(){
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("AvailableStickers") as! AvailableStickersViewController
        
        do {
            print (">>>>>>>ENTROU NO REFRESH<<<<<<<<<")
            images.removeAll()

            titles = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(vc.imagesDirectoryPath)
            for image in titles {
                let data = NSFileManager.defaultManager().contentsAtPath(vc.imagesDirectoryPath.stringByAppendingString("/\(image)"))
                let image = UIImage(data: data!)
                images.append(image!)
                print(">>>>>>>>>>> APPEND NO IMAGES<<<<<<<<<")
                print(images)
            }
//            self.stickersCollectionView.reloadData()
            self.selfiesCollectionView.reloadData()
        } catch {
            print("Error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selfiesCollectionView.reloadData()
        
        selfiesCollectionView.delegate = self
        stickersCollectionView.delegate = self
        
        selfiesCollectionView.dataSource = self
        stickersCollectionView.dataSource = self

//        refreshTable()

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
