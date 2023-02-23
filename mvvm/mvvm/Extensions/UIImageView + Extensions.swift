//
//  UIImageView + Extensions.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
    
}
