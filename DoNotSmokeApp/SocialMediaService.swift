//
//  SocialMediaService.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 20/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import Social
import UIKit

class SocialMediaService {
    
    internal var view_controller: UIViewController!
    
    internal let twitter_service = SLServiceTypeTwitter
    internal let facebook_service = SLServiceTypeFacebook
    
    internal var service_is_available = { service in
        return SLComposeViewController.isAvailable(forServiceType: service)
    }
    
    init(vc: UIViewController) {
        self.view_controller = vc
    }
    
    internal func social_media_not_available() {
        let alert = UIAlertController(title: "Você não está logado!", message: "Vá nas configurações e faça o login na sua conta do Facebook para compartilhar.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        view_controller.present(alert, animated: true, completion: nil)
    }
    
    internal func sheet(of_service service: String, with_image image: UIImage?, and_text text: String) {
        let sheet: SLComposeViewController = SLComposeViewController(forServiceType: service)
        sheet.setInitialText(text)
        if let shared_image = image {
            sheet.add(shared_image)
        }
        view_controller.present(sheet, animated: true, completion: nil)
    }
    
    internal func share(service: String, with_image image: UIImage?, and_text text: String) {
        if service_is_available(service) {
            sheet(of_service: service, with_image: image, and_text: text)
        } else {
            social_media_not_available()
        }
    }
    
}

extension SocialMediaService {
    func twitter_share(with_image image: UIImage?, and_text text: String) {
        share(service: twitter_service, with_image: image, and_text: text)
    }
    
    func facebook_share(with_image image: UIImage?, and_text text: String) {
        share(service: facebook_service, with_image: image, and_text: text)
    }
}

