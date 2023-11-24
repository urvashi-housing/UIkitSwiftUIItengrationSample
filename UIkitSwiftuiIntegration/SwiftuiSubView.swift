//
//  SwiftuiSubView.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import SwiftUI

struct SwiftuiSubView: View {
    var body: some View {
        VStack{
            Image("turtlerock")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            Text("SwiftUI SubView")
        }
    }
}

#Preview {
    SwiftuiSubView()
}
