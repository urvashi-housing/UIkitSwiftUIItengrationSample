//
//  ContentView.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
        @State private var showingImagePicker = false
    @State private var isDarkModeOn = false
    @State private var bgColor = Color.white
    @ObservedObject var stepCount : StepCountModel
        var body: some View {
            VStack(alignment: .center) {
                image?
                    .resizable()
                    .scaledToFit()
                
                UIKitToSwiftUISubView(isDarkModeOn: $isDarkModeOn, headerText: "Hello MJ")
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                
                
                Button("Select Image") {
                   showingImagePicker = true
                }
                Text(stepCount.stepCount.description)
            }
            .background(bgColor)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { oldValue, newValue in
                loadImage()
            }
//            .onChange(of: isDarkModeOn) { oldValue, newValue in
//                if newValue == true{
//                    bgColor = .black
//                }
//                else{
//                    bgColor = .white
//                }
//            }
        }
        
        

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
    

//#Preview {
//    ContentView()
//}
