//
//  UIKitToSwiftUISubView.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import Foundation
import SwiftUI

struct UIKitToSwiftUISubView: UIViewRepresentable,UIKitSampleSubViewDelegate{
    @Binding var isDarkModeOn: Bool
    var headerText : String
    
    func makeUIView(context: Context) -> UIKitSampleSubView {
        let uikitSubview = UIKitSampleSubView()
        uikitSubview.backgroundColor = .red
        uikitSubview.delegate = self
        return uikitSubview
    }

    func didChangeToggleValue(isOn: Bool) {
        self.isDarkModeOn = isOn
    }
    func updateUIView(_ uiView: UIKitSampleSubView, context: Context) {
        uiView.headerLabel.text = headerText
        if isDarkModeOn == true {
            uiView.backgroundColor = .white
        }
        else{
            uiView.backgroundColor = .red
        }
        
    }
    
    typealias UIViewType = UIKitSampleSubView
    

 
    
}
