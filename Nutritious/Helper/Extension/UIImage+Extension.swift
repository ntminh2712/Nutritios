//
//  UIImage+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import Kingfisher
extension UIImageView {
    
    func makeCicleVImage() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
  
}
extension UIImageView {
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    func rotate(duration: Double = 5) {
        if layer.animation(forKey: UIImageView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            layer.add(rotationAnimation, forKey: UIImageView.kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIImageView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIImageView.kRotationAnimationKey)
        }
    }
    func setCustomImage(_ imgURLString: String?, defaultAvatar: String?) {
        if let url = URL(string: imgURLString ?? "") as? URL
        {
            self.kf.setImage(with: url)
        }else{
            self.image = UIImage(named: "\(defaultAvatar)")
        }
    }
}

@IBDesignable
class CardImage: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = false
        }
        
    }
    @IBInspectable var shadowRadius:CGFloat {
        get{
            return layer.shadowRadius
        }
        set{
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.shadowColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.shadowColor = UIColor.black.cgColor
            layer.masksToBounds = false
        }
    }
    
    
    
}
