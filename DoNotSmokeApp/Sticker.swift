//
//  Sticker.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 02/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//


import Foundation
import UIKit

class Sticker: UIImageView {
    
    fileprivate var dragStartPositionRelativeToCenter : CGPoint?
    fileprivate lazy var active_gesture: Set<UIGestureRecognizer> = []
    
    init(sticker: UIImage, view: UIView) {
        super.init(image: sticker)
        self.layer.position = view.center
        self.isUserInteractionEnabled = true
        
        //TODO: tap seria para excluir, mas ainda deve ser decidido.
        let tap = UITapGestureRecognizer(target: self, action: nil)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handle_pan(gesture:)))
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handle_rotation(gesture:)))
        let gestures = [tap, pan, rotate]
        
        gestures.forEach{ self.addGestureRecognizer($0); $0.delegate = self }
        
        view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Sticker: UIGestureRecognizerDelegate {
    
    private func apply_gesture(_ gesture: UIGestureRecognizer) {
        if gesture.is_rotation {
            let rotation_gesture = gesture as! UIRotationGestureRecognizer
            handle_rotation(gesture: rotation_gesture)
        }
        if gesture.is_pan {
            let pan_gesture = gesture as! UIPanGestureRecognizer
            handle_pan(gesture: pan_gesture)
        }
    }
    
    @objc fileprivate func handle_pan(gesture: UIPanGestureRecognizer) {
        
        let locationInView = gesture.location(in: self.superview)
        
        if gesture.state == .began {
            self.dragStartPositionRelativeToCenter = CGPoint(x: locationInView.x - center.x, y: locationInView.y - center.y)
        }
        
        if gesture.state == .ended {
            self.dragStartPositionRelativeToCenter = nil
        }
        
        guard let drag_x = dragStartPositionRelativeToCenter?.x else { return }
        guard let drag_y = dragStartPositionRelativeToCenter?.y else { return }
        UIView.animate(withDuration: 0.1) {
            self.center = CGPoint(x: locationInView.x - drag_x,
                                  y: locationInView.y - drag_y)
        }
        
    }
    
    @objc fileprivate func handle_rotation(gesture: UIRotationGestureRecognizer) {
        let transform = CGAffineTransform(rotationAngle: gesture.rotation)
        self.transform = transform
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return (gestureRecognizer.is_rotation && otherGestureRecognizer.is_pan) ? true : false
    }
    
}

extension UIGestureRecognizer {
    var is_rotation: Bool { return self is UIRotationGestureRecognizer ? true : false}
    var is_pan: Bool { return self is UIPanGestureRecognizer ? true : false}
}

extension CGFloat {
    var normalize: CGFloat {
        return self > 6 ? 6 : (self < 1 ? 1 : self)
    }
}

