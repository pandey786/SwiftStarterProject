//
//  AppExtensions.swift
//  SwiftStarterProject
//
//  Created by Pandey on 18/07/17.
//  Copyright © 2017 Pandey. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIImageView Extesion
// MARK: -
let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadImageWithUrl(urlString: String) {
        
        //Remove Existing Image
        self.image = nil
        
        //Check for Cached Images
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        //Download Image From URL
        guard let url = URL.init(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //Check For Data
            guard let respData = data else {
                return
            }
            
            //Check For Error
            guard let image = UIImage.init(data: respData) else {
                return
            }
            
            //Set Downloaded Image to Image View
            DispatchQueue.main.async {
                imageCache.setObject(image, forKey: urlString as AnyObject)
                self.image = image
            }
        }.resume()
    }
}
