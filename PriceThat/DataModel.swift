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
    var ebay: String = "https://ebay.com"
    var offerup: String = "https://offerup.com"
}

class DataModel: ObservableObject {
    
    @Published var item: UIImage? = nil
    @Published var itemPhoto_64 = "Test"
    @Published var showView = 0
    @Published var brand: String = " "
    @Published var condition: String = "Used"
    @Published var catagory: String = "Other"
    @Published var price: String = "-"
    @Published var title: String = "Item Not Found"
    @Published var ebayLink: String = "https://www.ebay.com"
    @Published var offerUpLink: String = "https://www.offerup.com"
    
    func callPriceAPI() {
        
        var keys: String? = ""
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)?.description
            }
        
        var APIItemPrice: String = "-"
        var APIItemTitle: String = "Item Not Found"
        var APIEbayLink: String = "https://ebay.com"
        var APIOfferUpLink: String = "https://offerup.com"
        
        
        
        guard let url = URL(string: keys!) else {
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
            "itemCondition": condition,
            "catagory": catagory
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
                APIEbayLink = APIResponse.ebay
                APIOfferUpLink = APIResponse.offerup
                
                
                print ("Title: \(APIItemTitle)")
                print ("Price: \(APIItemPrice)")
                print ("Ebay: \(APIEbayLink)")
                print ("OfferUp: \(APIOfferUpLink)")
            }
            catch {
                print("API Response Error")
            }
            
            DispatchQueue.main.async {
                
                self.price = APIItemPrice
                self.title = APIItemTitle
                self.ebayLink = APIEbayLink
                self.offerUpLink = APIOfferUpLink
                self.showView = 2
            }
        }
        
        task.resume()
        
        
    }
    
}

