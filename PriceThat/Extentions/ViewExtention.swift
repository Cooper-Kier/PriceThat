//
//  ViewExtention.swift
//  PriceThat
//
//  Created by Cooper Kier on 7/27/24.
//

import Foundation
import SwiftUI
extension View {
    @MainActor func render(scale displayScale: CGFloat = 1.0) -> UIImage? {
        let renderer = ImageRenderer(content: self)

        renderer.scale = displayScale
        
        return renderer.uiImage
    }
    
}
