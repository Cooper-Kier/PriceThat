//
//  PriceThatApp.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import SwiftUI

@main
struct PriceThatApp: App {
    
    @ObservedObject var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView(content: {
                
                switch dataModel.showView {
                    
                case 0 :
                    
                    CameraScreen(dataModel: dataModel)
                
                case 1:
                    
                    PhotoView(tempBrand: "-", tempCondition: "Good", isLoading: false)
                    
                case 2:
                    
                    PricedView(dataModel: dataModel)
                    
                default:
                    
                    CameraScreen(dataModel: dataModel)
                    
                }
                
                
            })
            
            .environmentObject(dataModel)
            
        }
    }
}
