//
//  ImageCaching.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation
import SwiftUI

struct ImageCaching {
    var cachingImage: NSCache<NSString, UIImage> = NSCache()
    
    subscript(forKey: String) -> UIImage? {
        get {
            return cachingImage.object(forKey: NSString(string: forKey))
        }
    }
    
    func set(forKey: String, image: UIImage) {
        cachingImage.setObject(image, forKey: NSString(string: forKey))
    }
}
