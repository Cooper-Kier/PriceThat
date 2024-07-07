//
//  PhotoView.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import SwiftUI

struct PhotoView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    @State var showBottomSheet = true
    
    @State var tempBrand: String
    @State var tempCondition: String
    @State var isLoading: Bool
    
    let conditions = ["Brand New", "Great", "Good", "Poor", "Bad"]
    let brands = ["-"]
    
    var body: some View {
            
            VStack {
                
                Image(uiImage: dataModel.item!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .overlay(
                        
                        ZStack{
                            
                            VStack{
                                
                                Spacer()
                                
                                VStack{
                                    
                                    VStack{
                                        
                                        VStack{
                                            
                                            HStack(){
                                                
                                                Spacer()
                                                Button{ //Top Left 'X' button
                                                    
                                                    dataModel.showView = 0
                                                    
                                                } label: {
                                                    
                                                    HStack{
                                                        
                                                        Text("Retake Photo")
                                                            .bold()
                                                            .foregroundColor(.white)
                                                            .font(.callout)
                                                        
                                                        Image(systemName: "camera")
                                                            .foregroundColor(.white)
                                                        
                                                    }
                                                    .background(Color.clear)
                                                    .cornerRadius(10)
                                                    
                                                }
                                                .padding()
                                                
                                            }
                                            .background(Color.clear)
                                            HStack{
                                                
                                                Spacer()
                                                Text("Condition")
                                                    .font(.title2)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                Spacer()
                                                
                                                
                                            }
                                        }
                                        
                                        Picker ("Select Condition", selection: $tempCondition) {
                                            
                                            ForEach(conditions, id: \.self){
                                                Text($0)
                                                
                                            }
                                        }
                                        .pickerStyle(.segmented)
                                        .background(Color.clear)
                                        .border(Color.white, width: 3)
                                        .cornerRadius(7)
                                        
                                        
                                    }
                                    .background(Color.clear)
                                    .padding(.horizontal, 10)
                                    
                                    
                                    HStack{
                                        
                                        Button{
                                            
                                            isLoading = true
                                            
                                            dataModel.condition = tempCondition
                                            dataModel.brand = tempBrand
                                            
                                            dataModel.callPriceAPI()
                                            
                                            
                                        } label: {
                                            
                                            ZStack{
                                                
                                                RoundedRectangle(cornerSize: CGSize(width: UIScreen.main.bounds.width-30, height: 50))
                                                    .foregroundColor(Color.white)
                                                    .background(Color.clear)
                                                
                                                ZStack{
                                                    
                                                    HStack{
                                                        
                                                        Spacer()
                                                        
                                                        Text("Price")
                                                            .font(.largeTitle)
                                                            .foregroundColor(Color("Color"))
                                                        
                                                        Spacer()
                                                        
                                                        
                                                    }
                                                    .frame(width: UIScreen.main.bounds.width-30, height: 50)
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "arrowshape.right.fill")
                                                            .foregroundColor(Color("Color"))
                                                            .imageScale(.large)
                                                    }
                                                    .frame(width: UIScreen.main.bounds.width-110, height: 50)
                                                }
                                            }
                                        }
                                        .padding()
                                        
                                        
                                    }
                                    .padding(.bottom, 20)
                                    .background(Color.clear)
                                    .frame(alignment: .top)
                                }
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.3)
                                .background(Color.black.opacity(0.7))
                                
                            }
                            .background(Color.clear)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            
                            if isLoading{
                                
                                VStack{
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: Color("Color")))
                                        .scaleEffect(3.5)
                                }
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                .background(.ultraThinMaterial)
                                
                            }
                        })
                
            }
            .ignoresSafeArea()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .environmentObject(dataModel)
        
    }
}
