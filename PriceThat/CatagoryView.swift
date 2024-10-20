//
//  CatagoryView.swift
//  PriceThat
//
//  Created by Cooper Kier on 7/27/24.
//

import SwiftUI

struct CatagoryView: View {
    
    @StateObject var dataModel: DataModel
    let imageSize: CGFloat = 35
    let borderWidth: CGFloat = 2
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("Color"))
                .background(Color("Color"))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack{
                Spacer()
                
                HStack{
                    Text("Choose a Catagory")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                        .padding()
                }
                .padding(.top, 30)
                Divider()
                    .frame(width: UIScreen.main.bounds.width-150)
                    .padding()
                HStack{
                    Spacer()
                    Button{ //Clothes
                        dataModel.showView = 1;
                        dataModel.catagory = "Clothes"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color"), lineWidth: borderWidth)
                                .foregroundColor(.white)
                                .padding()
                            VStack{
                                Image(systemName: "tshirt.fill")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: imageSize))
                                Text("Clothes")
                                    .foregroundColor(Color("Color"))
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    Button{ //Tech
                        dataModel.showView = 1;
                        dataModel.catagory = "Tech"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color"), lineWidth: borderWidth)
                                .foregroundColor(.white)
                                .padding()
                            VStack{
                                Image(systemName: "desktopcomputer")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: imageSize))
                                Text("Tech")
                                    .foregroundColor(Color("Color"))
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(1)
                HStack{
                    Spacer()
                    Button{ //Toys
                        dataModel.showView = 1;
                        dataModel.catagory = "Toys"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color"), lineWidth: borderWidth)
                                .foregroundColor(.white)
                                .padding()
                            VStack{
                                Image(systemName: "airplane")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: imageSize))
                                Text("Toys")
                                    .foregroundColor(Color("Color"))
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    Button{ //Tools
                        dataModel.showView = 1;
                        dataModel.catagory = "Tools"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color"), lineWidth: borderWidth)
                                .foregroundColor(.white)
                                .padding()
                            VStack{
                                Image(systemName: "hammer.fill")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: imageSize))
                                Text("Tools")
                                    .foregroundColor(Color("Color"))
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(1)
                HStack{
                    Spacer()
                    Button{ //Sports
                        dataModel.showView = 1;
                        dataModel.catagory = "Sports"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color"), lineWidth: borderWidth)
                                .foregroundColor(.white)
                                .padding()
                            VStack{
                                Image(systemName: "figure.baseball")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: imageSize))
                                Text("Sports")
                                    .foregroundColor(Color("Color"))
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    Button{ //Other
                        dataModel.showView = 1;
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color"), lineWidth: borderWidth)
                                .foregroundColor(.white)
                                .padding()
                            VStack{
                                Image(systemName: "option")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: imageSize))
                                Text("Other")
                                    .foregroundColor(Color("Color"))
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(1)
                Divider()
                    .frame(width: UIScreen.main.bounds.width-150)
                    .padding()
                    .padding(.bottom, 30)
            }
            .background(Color.white)
            .frame(width: UIScreen.main.bounds.width-25, height: UIScreen.main.bounds.height)
        }
    }
}

