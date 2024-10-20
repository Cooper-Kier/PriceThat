//
//  Coordinator.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import Foundation
import SwiftUI


class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var dataModel: DataModel
    var picker: ImagePickerView
    
    init(picker: ImagePickerView, dataModel: DataModel) {
        
        self.picker = picker
        self.dataModel = dataModel
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let capturedImage = info[.originalImage] as? UIImage else { return }
        
        dataModel.item = capturedImage
        dataModel.showView = 3
        dataModel.itemPhoto_64 = capturedImage.reduceImageSize()!.base64!
        
        
    }
    

}

extension NSDictionary {
    var swiftDictionary: Dictionary<String, Any> {
        var swiftDictionary = Dictionary<String, Any>()

        for key : Any in self.allKeys {
            let stringKey = key as! String
            if let keyValue = self.value(forKey: stringKey){
                swiftDictionary[stringKey] = keyValue
            }
        }

        return swiftDictionary
    }
}
