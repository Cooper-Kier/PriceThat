//
//  UIImageExtention.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import Foundation
import AVFoundation
import SwiftUI

extension UIImage {
    
    func reduceImageSize() -> UIImage? {
        
        let size = CGSize(width: 320, height: 320)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    var base64: String? {
        
        self.jpegData(compressionQuality: 0.5)?.base64EncodedString()
    }
}
