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
                        .font(.system(size: 140, weight: .light))
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .bold()
                        .padding(.top, 20)
                        .padding(.bottom, 0)
                }
                
                
                Text(dataModel.title)
                    .foregroundStyle(Color("Color"))
                    .font(.title2)
                
                Spacer()
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width-100)
                    .padding()
                
                
                Button {
                    UIApplication.shared.open(URL(string: dataModel.ebayLink)!)
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width-30, height: 70)
                        
                        HStack{
                            Spacer()
                            Image("EbayLogo")
                                .resizable()
                                .frame(width: 150, height: 60) //2.5x ratio
                            Spacer()
                        }
                    }
                    .clipped()
                    .shadow(radius: 2)
                }
                Button {
                    UIApplication.shared.open(URL(string: dataModel.offerUpLink)!)
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width-30, height: 70)
                        
                        HStack{
                            Spacer()
                            Image("OfferUpLogo")
                                .resizable()
                                .frame(width: 240, height: 60) //4x ratio
                            Spacer()
                        }
                    }
                    .clipped()
                    .shadow(radius: 2)
                }
                
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width-100)
                    .padding()
                
                HStack(){
                    
                    Spacer()
                    
                    Button {
                        
                        dataModel.showView = 0
                
                    } label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width-30, height: 70)
                                .shadow(radius: 2)
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
        .frame( width: UIScreen.main.bounds.width - 5, height: UIScreen.main.bounds.height - 50)
        .background(.white)
    }
}

