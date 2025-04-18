//
//  ContentView.swift
//  Authentication
//
//  Created by EZen on 2025/04/18.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var faceIDAuthManager = FaceIDAuthManager()
    @State var showingImageSourceSelection: Bool = false
    
    @State var showingImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var selectedImage: UIImage?
    
    @State var portraitImage: UIImage?
    @State var backSideImage: UIImage?
    @State var isPortraitFlag: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    ColumnCardView(title: "人脸识别", desc: "识别你的身份", columnImage: UIImage(named: "camera")!)
                        .onTapGesture {
                            if !faceIDAuthManager.isFaceIDAuthenticated {
                                faceIDAuthManager.authenticateWithFaceID()
                            }
                        }
                    ColumnCardView(title: "身份证正面", desc: "上传身份证人像面", columnImage: portraitImage ?? UIImage(named: "portrait")!)
                        .onTapGesture {
                            self.isPortraitFlag = true
                            self.showingImageSourceSelection.toggle()
                        }
                    ColumnCardView(title: "身份证反面", desc: "上传身份证国徽面", columnImage: backSideImage ?? UIImage(named: "backside")!)
                        .onTapGesture {
                            self.isPortraitFlag = false
                            self.showingImageSourceSelection.toggle()
                        }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("身份认证")
            .navigationBarTitleDisplayMode(.inline)
        }
        .actionSheet(isPresented: $showingImageSourceSelection) {
            selectedImageSheet
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: {
            switch isPortraitFlag {
            case true:  portraitImage = selectedImage
            case false: backSideImage = selectedImage
            }
        }) {
            ImageUploadView(sourceType: sourceType, selectedImage: $selectedImage)
        }
    }
       
    /// 选择上传方式
    private var selectedImageSheet: ActionSheet {
        ActionSheet(
            title: Text("选择上传方式"),
            buttons: [
                Alert.Button.default(Text("相机"), action: {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        /// 打开相机
                        self.sourceType = .camera
                        self.showingImagePicker.toggle()
                    }
                    else {
                        print("相机不可用")
                    }
                }),
                Alert.Button.default(Text("相册"), action: {
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        /// 打开相册
                        self.sourceType = .photoLibrary
                        self.showingImagePicker.toggle()
                    }
                    else {
                        print("相册不可用")
                    }
                }),
                Alert.Button.cancel(Text("取消"))
            ]
        )
        
    }
}

#Preview {
    ContentView()
}
