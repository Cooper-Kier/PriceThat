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
    
    @State private var sheet = true
    @State private var settingsDetent = PresentationDetent.fraction(0.40)
    
    let conditions = ["Brand New", "Great", "Good", "Poor"]
    let brands = ["-"]
    
    var body: some View {
            
        VStack {
            if isLoading{
                Image(uiImage: dataModel.item!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .overlay(
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("Color")))
                            .scaleEffect(3.5)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .background(.ultraThinMaterial)
                            .ignoresSafeArea()
                    )
            } else {
                Image(uiImage: dataModel.item!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .sheet(isPresented: $sheet){
                        VStack{
                            Spacer()
                            VStack{
                                HStack(){
                                    Spacer()
                                    Button{ //Retake Photo Button
                                        dataModel.showView = 0
                                    } label: {
                                        HStack{
                                            Text("Retake Photo")
                                                .bold()
                                                .foregroundColor(Color("Color"))
                                                .font(.callout)
                                            Image(systemName: "camera")
                                                .foregroundColor(Color("Color"))
                                        }
                                        .padding()
                                    }
                                }
                                HStack{ //Title
                                    Spacer()
                                    Text("Condition")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(Color("Color"))
                                    Spacer()
                                }
                                Picker ("Select Condition", selection: $tempCondition) { //Condition Selector
                                    
                                    ForEach(conditions, id: \.self){
                                        Text($0)
                                            .foregroundColor(Color("Color"))
                                        
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(height: UIScreen.main.bounds.height*0.14)
                                HStack{
                                    Button{
                                        isLoading = true
                                        dataModel.condition = tempCondition
                                        dataModel.brand = tempBrand
                                        dataModel.callPriceAPI()
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color("Color"), lineWidth: 2)
                                                .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.085)
                                            HStack{
                                                Spacer()
                                                Text("Price")
                                                    .foregroundColor(Color("Color"))
                                                    .font(.title)
                                                    .padding()
                                                Spacer()
                                            }
                                            .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.085)
                                            HStack{
                                                Spacer()
                                                Image(systemName: "arrowshape.right")
                                                    .foregroundColor(Color("Color"))
                                                    .font(.system(size: 35))
                                                    .padding(.trailing, 30)
                                            }
                                            .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.085)
                                        }
                                        .padding(.bottom, 12)
                                    }
                                }
                            } //End of lower VStack
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.40)
                            .background(Color.white)
                        }
                        .interactiveDismissDisabled()
                        .presentationDetents([.fraction(0.40), .fraction(0.13)], selection: $settingsDetent)
                    } //End of sheet
            } //End of else
        } //End of Largest VStack
            .ignoresSafeArea()
            .environmentObject(dataModel)
    }
}
