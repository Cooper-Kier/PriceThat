//
//  PricedView.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import SwiftUI

struct PricedView: View {
    
    @StateObject var dataModel: DataModel
    
    var body: some View {
        
        VStack{
            
            Text("PriceThat")
                .font(.title)
                .foregroundColor(Color("Color"))
                .padding()
            
            Divider()
                .frame(width: UIScreen.main.bounds.width-100)
            
            Spacer()
            
            VStack(){
                
                Spacer()
                ZStack{
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 240)
                    
                    Text(dataModel.price)
                        .foregroundStyle(Color("Color"))
                        .font(.system(size: 150, weight: .light))
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .bold()
                        .padding()
                }
                
                
                Text(dataModel.title)
                    .foregroundStyle(Color("Color"))
                    .font(.title)
                
                Spacer()
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width-100)
                
                HStack(){
                    
                    Spacer()
                    
                    Button {
                        
                        dataModel.showView = 0
                        
                        
                    } label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width-40, height: 80)
                                .shadow(radius: 10)
                                .padding()
                            
                            HStack{
                                
                                Text("New Item")
                                    .foregroundStyle(Color("Color"))
                                    .font(.headline)
                                Image(systemName: "camera")
                                    .foregroundColor(Color("Color"))
                                    
                            }
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                }
            }
            
            Spacer()
            
            
        }
        .background(.white)
    }
}

