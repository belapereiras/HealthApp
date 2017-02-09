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
    
    @IBOutlet weak var openCameraAgainOutlet: UIButton!
    @IBOutlet weak var saveAndShareButtonsOutlet: UIStackView!
    @IBOutlet var AvailableStickersCollectionView: UICollectionView!
    @IBOutlet var selfieImageView: UIImageView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var takePhotoButtonOutlet: UIButton!
    lazy var views: [UIView] = []
    
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
        let _ = Sticker(sticker: sticker_picked, view: self.view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //AvailableStickersCollectionView.delegate = self
        self.AvailableStickersCollectionView.reloadData()
        views = [openCameraAgainOutlet, saveAndShareButtonsOutlet, AvailableStickersCollectionView, cancelButton, cameraView, takePhotoButtonOutlet]
        saveAndShareButtonsOutlet.isHidden = true
        openCameraAgainOutlet.isHidden = true
        AvailableStickersCollectionView.isHidden = true
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
            self.selfieImageView.image = image
            
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
        
        views(are_hidden: true)
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, true, 0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        //finalImage = UIGraphicsGetImageFromCurrentImageContext()
        selfieImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //views(are_hidden: false)
    }
    
    func views(are_hidden hide: Bool) {
        views.forEach{$0.isHidden = hide}
    }
    
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
