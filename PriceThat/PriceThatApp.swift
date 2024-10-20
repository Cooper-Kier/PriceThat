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
                    
                case 0 : //Camera Screen
                    
                    CameraScreen(dataModel: dataModel)
                
                case 1: //Photo View With Condition Selection
                    
                    PhotoView(tempBrand: "-", tempCondition: "Good", isLoading: false)
                    
                case 2: //Final Price View
                    
                    PricedView(dataModel: dataModel)
                
                case 3: //Catagory Selection
                    
                    CatagoryView(dataModel: dataModel)
                    
                default:
                    
                    CameraScreen(dataModel: dataModel)
                    
                }
                
                
            })
            
            .environmentObject(dataModel)
            
        }
    }
}
