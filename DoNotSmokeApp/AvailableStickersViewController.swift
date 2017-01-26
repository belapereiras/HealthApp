//
//  AvailableStickersViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/27/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit
import Social

class AvailableStickersViewController: UIViewController, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    var savePhotos = SavePhotos.getSPSingleton()

    var selfieImage: UIImage?
    var stickerPicked: UIImage?
    var finalImage: UIImage?
    var user = User.getUserSingleton()
    var benefitsAchieved: [Benefit] = []
    
    var tapGesture: UITapGestureRecognizer!
    @IBOutlet var AvailableStickersCollectionView: UICollectionView!
    @IBOutlet var selfieImageView: UIImageView!
    @IBOutlet var cancelButton: UIButton!
    
    var availableStickers = [UIImage(named: "20dias"), UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]

// MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.availableStickers.count
    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! AvailableStickersCell
        
        //TODO: - Change the cells images if the benefit has been achieved -
        
        cell.cellImage.image = self.availableStickers[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        stickerPicked = availableStickers[indexPath.row]
        
//        stickerPicked = UIImageView()
//        stickerPicked?.image = availableStickers[indexPath.row]
        //        selfieImageView.addSubview(stickerPicked!)
        //        selfieImageView.subviews.forEach{$0.isUserInteractionEnabled = true; $0.isHidden = false; $0.center = CGPoint(dictionaryRepresentation: selfieImageView.center as! CFDictionary)!}
        //        print("*** selfieImageView.subviews.count", selfieImageView.subviews.count)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        AvailableStickersCollectionView.delegate = self
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        tapGesture.delegate = self
        selfieImageView.addGestureRecognizer(tapGesture)
        initialize_timer(with_interval: 5, handler: { (timer: Timer) in
            let savings = self.user.savings
            if let benefits = self.user.moneyAchievements.benefits_achieved(savings) {
                self.benefitsAchieved = benefits
                DispatchQueue.main.async(execute: {
                    self.AvailableStickersCollectionView.reloadData()
                })
            }
        })
        //loadSelfieToImageView()
        guard let image = selfieImage else { return }
        selfieImageView.image = image
        selfieImageView.contentMode = .scaleAspectFit
    }


    @IBAction func openCameraAgain(_ sender: AnyObject) {
    }
    
    @IBAction func cancelStickersCollage(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "cancel", sender: cancelButton)
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func saveToCameraRoll(_ sender: AnyObject) {
        
        finalImage = selfieImageView.image
        guard let final_image = finalImage else {fatalError("MergedImage shouldn't be nil")}
        
        UIImageWriteToSavedPhotosAlbum(final_image, nil, nil, nil)
        savePhotos.saveLocally(final_image)
        
    }
    
    func imageTapped(_ sender: UITapGestureRecognizer) {
        print("Entrei")
        let point = sender.location(in: self.selfieImageView)
        if let image = mergeStickerAndSelfie(point) {
            selfieImageView.image = image
        }
        
    }
    
    func mergeStickerAndSelfie(_ point: CGPoint) -> UIImage? {
    
        guard let userImage = selfieImageView.image else { fatalError("Selfie must not be nil") }
        guard let stickerImage = stickerPicked else { fatalError("Sticker must not be nil") }

        let size = CGSize(width: userImage.size.width, height: userImage.size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let selfieRect = CGRect(origin: CGPoint.zero, size: size)
        
        let stickerSize = CGSize(width: stickerImage.size.width * 3, height: stickerImage.size.height * 3)
        
        print(point)
        let point = checkPosition(selfieRect, stickerSize: stickerSize, point: point)
        let stickerRect = CGRect(x: point.x, y: point.y, width: stickerSize.width, height: stickerSize.height)

        userImage.draw(in: selfieRect)
        stickerImage.draw(in: stickerRect)
        
        let mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return mergedImage
    }
    
    func checkPosition(_ selfieRect: CGRect, stickerSize: CGSize, point: CGPoint) -> CGPoint {
        let xMultiplier = selfieRect.width / stickerSize.width
        let yMultiplier = selfieRect.height / stickerSize.height
    
        let newX = point.x * xMultiplier
        let newY = point.y * yMultiplier
        
        let newPoint = CGPoint(x: newX, y: newY)
        
        return newPoint
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
    
    // escolher o sticker -> sticker aparece no centro da selfie -> arrastar o sticker para posição final -> merge imagens
    
}


//MARK: Extension that handles sharing in Social Medias.
extension AvailableStickersViewController {
    
    @IBAction func mailShare(_ sender: AnyObject) {
        //TODO: Share with trusted connections(contract witnesses; not implemented yet)
    }
    
    
    @IBAction func twitterShare(_ sender: AnyObject) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Olhe o que já posso comprar com o dinheiro economizado ao parar de fumar! #StickWithMeApp")
            twitterSheet.add(finalImage)
            self.present(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Você não está logado!", message: "Vá nas configurações e faça o loign na sua conta do Facebook para compartilhar.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func facebookShare(_ sender: AnyObject) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Olhe o que já posso comprar com o dinheiro economizado ao parar de fumar! #StickWithMeApp")
            facebookSheet.add(finalImage)
            self.present(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Você não está logado!", message: "Vá nas configurações e faça o loign na sua conta do Facebook para compartilhar.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
