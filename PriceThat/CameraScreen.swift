//
//  CameraScreen.swift
//  PriceThat
//
//  Created by Cooper Kier on 6/25/24.
//

import Foundation
import SwiftUI
import PhotosUI

struct CameraScreen: View {
    @State private var capturedImage: UIImage?
    @State private var showCapturedImage = false
    @State private var didTapCapture: Bool? = false
    @State private var flash: Bool = false
    @State private var cameraDevice: Int = Camera.Rear.rawValue
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    
    @ObservedObject var dataModel: DataModel
    
    var body: some View {
        VStack{
            ImagePickerView(capturedImage: self.$capturedImage,
                            didTapCapture: self.$didTapCapture,
                            flash: self.$flash,
                            cameraDevice: self.$cameraDevice,
                            sourceType: .camera,
                            dataModel: dataModel
            )
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(
                VStack{
                    HStack(alignment: .bottom){ //Top Stack
                        
                        Spacer()
                        Image(systemName: flash ? "bolt.fill" : "bolt.slash.fill")
                            .foregroundColor(Color("Color"))
                            .font(.system(size: 18))
                            .onTapGesture {
                                flash.toggle()
                            }
                        
                    }
                    .padding()
                    .padding(.top, 48)
                    .padding(.horizontal, 8)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.12)
                    .background(Color.black.opacity(0.70))
                    
                    Spacer()
                    
                    HStack{
                        ZStack(alignment: .center) {
                            
                            Image(systemName: "photo.stack")
                                .foregroundColor(Color("Color"))
                                .font(.system(size: 18))
                            PhotosPicker("   ", selection: $pickerItem, matching: .images)
                        }
                                .frame(width: 60, height: 60)
                        
                        Spacer()
                        
                        Button {
                            
                            didTapCapture = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                didTapCapture = false
                            }
                       } label: {
                           ZStack {
                               
                               Circle()
                                   .fill(self.didTapCapture ?? false ? .purple : Color.white)
                                   .frame(width: 60, height: 60)
                           }
                       }
                        
                        Spacer()
                        
                        Button {
                            if(cameraDevice == Camera.Rear.rawValue){ cameraDevice = Camera.Front.rawValue} else{ cameraDevice = Camera.Rear.rawValue }
                        } label: {
                            
                            ZStack(alignment: .center) {
                                
                                Image(systemName: "arrow.triangle.2.circlepath.camera")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 18))
                                
                            }
                            .frame(width: 60, height: 60)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/7)
                    .background(Color.black.opacity(0.7))
                }
            )
        }
        .onChange(of: pickerItem){
            Task{
                do {
                    selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                    dataModel.item = selectedImage?.render()
                    print("Image converted to UIImage")
                    
                } catch {
                    print ("Image to UIImage failed")
                }
                
                dataModel.itemPhoto_64 = dataModel.item!.reduceImageSize()!.base64!
                dataModel.showView = 3
            }
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .environmentObject(dataModel)
    }
}

enum Camera : Int {
    case Rear = 0
    case Front = 1
}
