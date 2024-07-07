//
//  DataModel.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import Foundation
import SwiftUI

struct JSONParse: Codable{
    
    var price: String = "-"
    var title: String = "Item Not Found"
}

class DataModel: ObservableObject {
    
    @Published var item: UIImage? = nil
    @Published var itemPhoto_64 = "Test"
    @Published var showView = 0
    @Published var brand: String = " "
    @Published var condition: String = "Used"
    @Published var price: String = "-"
    @Published var title: String = "Item Not Found"
    
    func callPriceAPI() {
        
        var APIItemPrice: String = "-"
        var APIItemTitle: String = "Item Not Found"
        
        guard let url = URL(string: "https://arkhjipeog.execute-api.us-east-2.amazonaws.com/default/PriceThatLambdaFunction") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        //Headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
        
        //Body
        let body: [String: String] = [
            "itemPhoto": itemPhoto_64,
            "itemBrand": brand,
            "itemCondition": condition
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        //Make Request
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let APIResponse = try JSONDecoder().decode(JSONParse.self, from: data)
                
                APIItemPrice = APIResponse.price
                APIItemTitle = APIResponse.title
                
                print ("Title: \(APIItemTitle)")
                print ("Price: \(APIItemPrice)")
            }
            catch {
                print("API Response Error")
            }
            
            DispatchQueue.main.async {
                
                self.price = APIItemPrice
                self.title = APIItemTitle
                self.showView = 2
            }
        }
        
        task.resume()
        
        
    }
    
}

