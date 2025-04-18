//
//  FaceIDAuthManager.swift
//  Authentication
//
//  Created by EZen on 2025/04/18.
//

import SwiftUI
import LocalAuthentication

class FaceIDAuthManager: ObservableObject {
    
    @Published var isFaceIDAuthenticated = false
    
    func authenticateWithFaceID() {
        
        Task {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "使用FaceID进行认证"
                let res = try? await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                switch res {
                case true:
                    self.isFaceIDAuthenticated = true
                default:
                    self.isFaceIDAuthenticated = false
                }
                return
            }
            
            print("不支持 FaceID ")
        }
    }
}
