//
//  AchievementsViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class AchievementsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    var savePhotos = SavePhotos.getSPSingleton()
    var user = User.getUserSingleton()

    var images:[UIImage] = []
    var titles:[String]!

    private var popupIsOpen = false
    
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
        var textToPass : String
        var imageToPass: UIImage
        
            if indexPath.row == 0 {
                textToPass = "20 dias sem fumar"
            } else {
                textToPass = String(self.user.moneyAchievements.benefits[indexPath.row - 1].completion_parameter)
            }
            
        imageToPass = self.achievementsStickers[indexPath.row]!
    
        presentPopUp(image: imageToPass, text: textToPass)
        }
        
    }

    func refreshTable() {
        
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
        
        //popUp.layer.cornerRadius = 20
        
        self.selfiesCollectionView.emptyDataSetSource = self
        self.selfiesCollectionView.emptyDataSetDelegate = self
        self.stickersCollectionView.emptyDataSetSource = self
        self.stickersCollectionView.emptyDataSetDelegate = self

        refreshTable()

        selfiesView.isHidden = true

        setupGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stickersCollectionView.reloadData()
    }
    
    // MARK: Empty DataSet DataSource
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        if selfiesView.isHidden {
            return UIImage(named: "noStickers")
        } else {
            return UIImage(named: "noPhotos")
        }
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
        let text: NSString = selfiesView.isHidden ? "Você não tem stickers ainda." : "Você não tem selfies ainda."
        let font = UIFont(name: "Lato-Medium", size: 16)
        let attributes = NSAttributedString(string: text as String, attributes: [NSForegroundColorAttributeName : UIColor.gray, NSFontAttributeName : font!])
        return attributes
        
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
        let description: NSString = selfiesView.isHidden ? "Continue economizando dinheiro para ganhar stickers." : "Clique na câmera para tirar uma foto com seus stickers!"
        let font = UIFont(name: "Lato-Light", size: 12)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        paragraph.lineBreakMode = .byWordWrapping
        let attributes: NSDictionary = [NSFontAttributeName: font!, NSForegroundColorAttributeName: UIColor.gray,
                                        NSParagraphStyleAttributeName: paragraph]
        return NSAttributedString(string: description as String, attributes: attributes as? [String : AnyObject])
        
    }
    
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -self.view.frame.height/10.0
    }
    
    // MARK: Empty DataSet Delegate
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
        return true
    }

    func setupGestureRecognizer() {
        let tapOnBackground = UITapGestureRecognizer(target: self, action: #selector(ProgressViewController.handleTap(_:)))
        tapOnBackground.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapOnBackground)
    }
    
    func handleTap (_ sender: UIGestureRecognizer) {
        
        if popupIsOpen {
            dismissPopUp()
            popupIsOpen = false
        } else {
            //self.dismiss(animated: true, completion: nil)
        }
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
    
    // MARK: POP UP METHODS
    
    private func presentPopUp(image: UIImage, text: String) {
        
        popupIsOpen = true
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpStickers") as! PopUpStickersViewController
        
        popUpVC.ppStickersImageReceived = image
        popUpVC.ppStickersTextReceived = text
        
        self.addChildViewController(popUpVC)
        
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        
        popUpVC.didMove(toParentViewController: self)
        
    }
    
    private func dismissPopUp() {
        
        let popUp = self.childViewControllers.first
        
        UIView.animate(withDuration: 0.25, animations: {
            popUp?.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            popUp?.view.alpha = 0
        }, completion: { (isFinished) in
            
            if isFinished{
                popUp?.willMove(toParentViewController: self)
                popUp?.view.removeFromSuperview()
                popUp?.removeFromParentViewController()
                
            }
        })
    }

  
}
