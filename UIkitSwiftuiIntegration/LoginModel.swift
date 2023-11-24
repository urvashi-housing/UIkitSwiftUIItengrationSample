//
//  LoginModel.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import Foundation


class LoginModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
}

class StepCountModel: ObservableObject{
    @Published var stepCount = 0
}
