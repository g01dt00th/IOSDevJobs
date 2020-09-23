//
//  OnboardingView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var user: UserModel
    
    @State private var secondQuestion = false
    
    var body: some View {
        ZStack{
            OnboardingViewFirstQuestion(secondQuestion: $secondQuestion)
                .offset(x: secondQuestion ? -500 : 0)
            
            IOSDevLevelSelectionView()
                .offset(x: secondQuestion ? 0 : 500)

        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var user = UserModel()
    
    static var previews: some View {
        Group {
            OnboardingView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            OnboardingView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            OnboardingView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            OnboardingView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
