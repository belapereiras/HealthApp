//
//  AvailableStickersViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/27/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit
import Social
import AVFoundation

class AvailableStickersViewController: UIViewController, UICollectionViewDelegate, UIGestureRecognizerDelegate, AVCapturePhotoCaptureDelegate {
    
    var savePhotos = SavePhotos.getSPSingleton()

    var selfieImage: UIImage?
    var stickerPicked: UIImage?
    var finalImage: UIImage?
    var user = User.getUserSingleton()
    var captureSesssion : AVCaptureSession!
    var cameraOutput : AVCapturePhotoOutput!
    var previewLayer : AVCaptureVideoPreviewLayer!
    var stickersIsOpen = true
    var sm_service: SocialMediaService!
    
    @IBOutlet weak var collectionBottomContraint: NSLayoutConstraint!
    @IBOutlet weak var stickersButtonOutlet: UIButton!
    @IBOutlet weak var openCameraAgainOutlet: UIButton!
    @IBOutlet weak var saveAndShareButtonsOutlet: UIStackView!
    @IBOutlet var AvailableStickersCollectionView: UICollectionView!
    @IBOutlet var selfieImageView: UIImageView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var takePhotoButtonOutlet: UIButton!
    lazy var stickers: [Sticker] = []
    lazy var take_photo_views: [UIView] = []
    lazy var stickers_views: [UIView] = []
    lazy var superior_views: [UIView] = []
    
    lazy var availableStickers = [UIImage(named: "ChocolateBar"), UIImage(named: "FastFood"), UIImage(named: "NewBook"), UIImage(named: "Pizza"), UIImage(named: "MovieTime"), UIImage(named: "HairCut"), UIImage(named: "Wine"), UIImage(named: "NewKicks"), UIImage(named: "FullTank"), UIImage(named:"Spotify"), UIImage(named: "DinnerForTwo"),  UIImage(named: "TeamTee"), UIImage (named: "Netflix"), UIImage(named: "Perfume")]
    

// MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.nbr_of_benefits
    }

// MARK: COLLECTION VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        print("Collection View")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! AvailableStickersCell
        cell.cellImage.image = self.availableStickers[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let sticker_picked = availableStickers[indexPath.row] else {return}
        
        let sticker = Sticker(sticker: sticker_picked, view: self.view)
        stickers.append(sticker)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.collectionBottomContraint.constant = -130
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    @IBAction func didPressStickersButton(_ sender: Any) {
        if stickersIsOpen {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.collectionBottomContraint.constant = -130
            self.view.layoutIfNeeded()
        }, completion: nil)
            stickersIsOpen = false
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.collectionBottomContraint.constant = 0
                self.view.layoutIfNeeded()
            }, completion: nil)
            stickersIsOpen = true
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //AvailableStickersCollectionView.delegate = self
        self.AvailableStickersCollectionView.reloadData()
        
        take_photo_views = [cameraView, takePhotoButtonOutlet, cancelButton]
        stickers_views = [stickersButtonOutlet, AvailableStickersCollectionView]
        superior_views = [openCameraAgainOutlet, saveAndShareButtonsOutlet]
        
        saveAndShareButtonsOutlet.isHidden = true
        openCameraAgainOutlet.isHidden = true
        AvailableStickersCollectionView.isHidden = true
        stickersButtonOutlet.isHidden = true
        sm_service = SocialMediaService(vc: self)
    }
}

//MARK: Extension that handles all camera related methods
extension AvailableStickersViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        setUpCameraView()
    }

    
    func setUpCameraView() {
        captureSesssion = AVCaptureSession()
        captureSesssion.sessionPreset = AVCaptureSessionPresetPhoto
        cameraOutput = AVCapturePhotoOutput()
    
        let device = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: AVCaptureDevicePosition.front)
        
        if let input = try? AVCaptureDeviceInput(device: device) {
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                if (captureSesssion.canAddOutput(cameraOutput)) {
                    captureSesssion.addOutput(cameraOutput)
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSesssion)
                    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                    //previewLayer.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                    cameraView.layer.addSublayer(previewLayer)
                    captureSesssion.startRunning()
                    previewLayer.frame = cameraView.bounds
                }
            } else {
                print("issue here : captureSesssion.canAddInput")
            }
        } else {
            print("some problem here")
        }
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput,  didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?,  previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings:  AVCaptureResolvedPhotoSettings, bracketSettings:   AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            print("error occure : \(error.localizedDescription)")
        }
        
        if  let sampleBuffer = photoSampleBuffer,
            let previewBuffer = previewPhotoSampleBuffer,
            let dataImage =  AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer:  sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
            print(UIImage(data: dataImage)?.size as Any)
            
            let dataProvider = CGDataProvider(data: dataImage as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: UIImageOrientation.right)
            
            cameraView.isHidden = true
            takePhotoButtonOutlet.isHidden = true
            cancelButton.isHidden = true
            saveAndShareButtonsOutlet.isHidden = false
            openCameraAgainOutlet.isHidden = false
            AvailableStickersCollectionView.isHidden = false
            stickersButtonOutlet.isHidden = false
            self.selfieImageView.image = image
            selfieImageView.isHidden = false
            
        } else {
            print("some error here")
        }
    }

    @IBAction func didPressTakePhoto(_ sender: Any) {
        
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [
            kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
            kCVPixelBufferWidthKey as String: 160,
            kCVPixelBufferHeightKey as String: 160
        ]
        settings.previewPhotoFormat = previewFormat
        cameraOutput.capturePhoto(with: settings, delegate: self)
        
    }

    @IBAction func openCameraAgain(_ sender: AnyObject) {
        cameraView.isHidden = false
        takePhotoButtonOutlet.isHidden = false
        cancelButton.isHidden = false
        saveAndShareButtonsOutlet.isHidden = true
        openCameraAgainOutlet.isHidden = true
        AvailableStickersCollectionView.isHidden = true
        stickersButtonOutlet.isHidden = true
        selfieImageView.isHidden = true
        //TODO: - Sticker Manager
        stickers.forEach{$0.removeFromSuperview();}
        stickers.removeAll()
    }
    
    @IBAction func cancelStickersCollage(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "cancel", sender: cancelButton)
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func saveToCameraRoll(_ sender: AnyObject) {
        
        mergeStickerAndSelfie()
        if let image = finalImage {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            savePhotos.saveLocally(image)
        }
    }
}

//MARK: Extension that handles the creation of the final image
extension AvailableStickersViewController {
    
    func mergeStickerAndSelfie() {
        
        take_photo_views.forEach{$0.isHidden = true}
        stickers_views.forEach{$0.isHidden = true}
        superior_views.forEach{$0.isHidden = true}
        
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, true, 0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        stickers_views.forEach{$0.isHidden = false}
        superior_views.forEach{$0.isHidden = false}
        
    }
    
}


//MARK: Extension that handles sharing in Social Medias.
extension AvailableStickersViewController {
    
    @IBAction func mailShare(_ sender: AnyObject) {
        //TODO: Share with trusted connections(contract witnesses; not implemented yet)
    }
    
    @IBAction func twitterShare(_ sender: AnyObject) {
        mergeStickerAndSelfie()
        sm_service.twitter_share(with_image: finalImage, and_text: "Olhe o que já posso comprar com o dinheiro economizado ao parar de fumar! #StickWithMeApp")
    }
    
    @IBAction func facebookShare(_ sender: AnyObject) {
        mergeStickerAndSelfie()
        sm_service.facebook_share(with_image: finalImage, and_text: "Olhe o que já posso comprar com o dinheiro economizado ao parar de fumar! #StickWithMeApp")
    }
    
}
