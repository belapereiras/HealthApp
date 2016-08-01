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

    var tapGesture: UITapGestureRecognizer!
    @IBOutlet var AvailableStickersCollectionView: UICollectionView!
    @IBOutlet var selfieImageView: UIImageView!
    @IBOutlet var cancelButton: UIButton!
    
    var availableStickers = [UIImage(named: "20dias"), UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "DinnerForTwo"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named: "TeamTee"), UIImage(named: "Netflix"), UIImage(named: "Perfume")]

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


        tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        tapGesture.delegate = self
        selfieImageView.addGestureRecognizer(tapGesture)
        //loadSelfieToImageView()
        guard let image = selfieImage else { return }
        selfieImageView.image = image

        selfieImageView.contentMode = .ScaleAspectFit

        // Do any additional setup after loading the view.
    }
   
    
//    func saveImage(image: UIImage, path: String) -> Bool {
//        let pngImageData = UIImagePNGRepresentation(image)
//        let result = pngImageData!.writeToFile(path, atomically: true)
//        return result
//    }
//    
//    func loadImageFromPath(path: String) -> UIImage? {
//        let data = NSData(contentsOfFile: path)
//        let image = UIImage(data: data!)
//        return image
//    }


    @IBAction func openCameraAgain(sender: AnyObject) {
    }
    
    @IBAction func cancelStickersCollage(sender: AnyObject) {

        self.performSegueWithIdentifier("cancel", sender: cancelButton)
        self.tabBarController?.selectedIndex = 0


    }
    
    @IBAction func saveToCameraRoll(sender: AnyObject) {
        
        finalImage = selfieImageView.image
        UIImageWriteToSavedPhotosAlbum(finalImage!, nil, nil, nil)
        
        savePhotos.saveLocally(finalImage!)

    }
    
    
    
    @IBAction func mailShare(sender: AnyObject) {
    }

    
    @IBAction func twitterShare(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Estou há 20 dias sem fumar e já posso comprar um livro com o dinheiro economizado! #StickWithMeApp")
            twitterSheet.addImage(finalImage)
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Você não está logado!", message: "Vá nas configurações e faça o loign na sua conta do Facebook para compartilhar.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func facebookShare(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Estou há 20 dias sem fumar e já posso comprar um livro com o dinheiro economizado! #StickWithMeApp")
            facebookSheet.addImage(finalImage)
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Você não está logado!", message: "Vá nas configurações e faça o loign na sua conta do Facebook para compartilhar.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        print("Entrei")
        let point = sender.locationInView(self.selfieImageView)
        if let image = mergeStickerAndSelfie(point) {
            selfieImageView.image = image
        }
        
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
        
        let stickerSize = CGSizeMake(stickerImage.size.width * 3, stickerImage.size.height * 3)
        
        print(point)
        let point = checkPosition(selfieRect, stickerSize: stickerSize, point: point)
        let stickerRect = CGRect(x: point.x, y: point.y, width: stickerSize.width, height: stickerSize.height)

        userImage.drawInRect(selfieRect)
        stickerImage.drawInRect(stickerRect)
        
        let mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return mergedImage
    }
    
    func checkPosition(selfieRect: CGRect, stickerSize: CGSize, point: CGPoint) -> CGPoint {
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
    
}
