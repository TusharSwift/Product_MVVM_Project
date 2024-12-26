//
//  UIImage+Extension.swift
//  Product_MVVM_Project
//
//  Created by Tushar on 26/12/24.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
