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
    var user = User.getUserSingleton()

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
    
    var achievementsStickers = [UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"),UIImage(named:"Spotify"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]
    
    
    func conditional_collection(_ collection: UICollectionView,is_sticker func1: ()->Any,is_selfie func2: ()->Any) -> Any {
        if collection == self.stickersCollectionView {
            return func1()
        } else {
            return func2()
        }
    }

// MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conditional_collection(collectionView, is_sticker: {return user.nbr_of_benefits}, is_selfie: { return images.count }) as! Int
    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return conditional_collection(collectionView, is_sticker: {
            let cellStickers = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AchievementsCell
            
            cellStickers.cellImageStickers.image = self.achievementsStickers[indexPath.row]
            
            return cellStickers
        }, is_selfie: {
            let cellSelfies = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! AchievementsCell
            
            cellSelfies.cellImageSelfies?.image = images[indexPath.row]
            cellSelfies.cellImageSelfies?.contentMode = .scaleAspectFit
            
            return cellSelfies
        }) as! UICollectionViewCell
    }
    
    
    
// MARK: SELECT COLLECTION VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if collectionView == self.stickersCollectionView {
            popUpImage.image = self.achievementsStickers[indexPath.row]
            if indexPath.row == 0 {
                popUpText.text = "20 dias sem fumar"
            } else {
                popUpText.text = String(self.user.moneyAchievements.benefits[indexPath.row - 1].completion_parameter)
            }

        
        self.popUpBackground.isHidden = false
        self.popUp.isHidden = false
        self.popUpImage.isHidden = false
        self.popUpText.isHidden = false
        self.popUpBackground.alpha = 0
        self.popUp.alpha = 0
        self.popUpImage.alpha = 0
        self.popUpText.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options:
            UIViewAnimationOptions.curveEaseOut, animations: {
                
                self.popUpBackground.alpha = 1.0
                self.popUp.alpha = 1.0
                self.popUpImage.alpha = 1.0
                self.popUpText.alpha = 1.0
            
            }, completion: { finished in
                
                self.popUpBackground.isHidden = false
                self.popUp.isHidden = false
                self.popUpImage.isHidden = false
                self.popUpText.isHidden = false
        })
        }
    }

    func refreshTable(){
        
        do {
            print (">>>>>>>ENTROU NO REFRESH<<<<<<<<<")
            images.removeAll()
            
            titles = try FileManager.default.contentsOfDirectory(atPath: savePhotos.imagesDirectoryPath)
            for image in titles {
                let data = FileManager.default.contents(atPath: savePhotos.imagesDirectoryPath + "/\(image)")
                if data != nil {
                    guard let image = UIImage(data: data!) else { break }
                    images.insert(image, at: 0)
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

        selfiesView.isHidden = true
    }

    func handleTap (_ sender: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.3, delay: 0, options:
            UIViewAnimationOptions.curveEaseOut, animations: {
                
                self.popUpBackground.alpha = 0
                self.popUp.alpha = 0
                self.popUpImage.alpha = 0
                self.popUpText.alpha = 0
            
            }, completion: { finished in
                
                self.popUpBackground.isHidden = true
                self.popUp.isHidden = true
                self.popUpImage.isHidden = true
                self.popUpText.isHidden = true
        })
    }
 
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selfiesView.isHidden = true
            stickersView.isHidden = false
            
        case 1:
            selfiesView.isHidden = false
            stickersView.isHidden = true
        default:
            break;
        }

    }
    
    @IBAction func didPressCameraButton(_ sender: Any) {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "AvailableStickers") as! AvailableStickersViewController
        
        self.present(vc, animated: true, completion: nil)
        
    }
  
}
