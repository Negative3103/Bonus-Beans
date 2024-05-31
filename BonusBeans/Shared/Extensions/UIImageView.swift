//
//  UIImageView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with url: URL, placeholder: UIImage) {
        if url == URL(fileURLWithPath: "") {
            DispatchQueue.main.async {
                self.image = placeholder
            }
        } else {
            self.sd_setImage(with: url, placeholderImage: placeholder, options: [], completed: nil)
        }
    }
    
    func setImage(with url: String? = nil, placeholder: UIImage = UIImage()) {
        guard let url = url, url != "" else {
            DispatchQueue.main.async {
                self.image = placeholder
            }
            return
        }
        
        self.sd_setImage(with: URL(string: url), placeholderImage: placeholder)
    }
    
    func setImage(_ image: UIImage, animated shouldAnimate: Bool) {
        self.image = image
        
        if shouldAnimate {
            let animationKey = "hub_imageAnimation"
            layer.removeAnimation(forKey: animationKey)
            
            let animation = CATransition()
            animation.duration = 0.3
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.type = .fade
            layer.add(animation, forKey: animationKey)
        }
    }
}
