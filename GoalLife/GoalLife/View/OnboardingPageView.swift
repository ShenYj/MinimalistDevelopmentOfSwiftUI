//
//  OnboardingPageView.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct OnboardingPageView: View {
    
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 320)
                .cornerRadius(6)
            VStack(spacing: 15) {
                Text(title)
                    .font(.title)
                    .bold()
                Text(description)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    OnboardingPageView(imageName: "", title: "", description: "")
}
