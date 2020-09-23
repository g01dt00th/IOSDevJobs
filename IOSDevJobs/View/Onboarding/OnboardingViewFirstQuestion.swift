//
//  OnboardingView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct OnboardingViewFirstQuestion: View {
    @EnvironmentObject var user: UserModel
    @Binding var secondQuestion: Bool
    
    @State private var devSelected = false
    @State private var hrSelected = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Which side are you on?")
                .font(.custom("SFMono-Bold", size: 34))
                .lineLimit(2)
                .padding(.leading, 20)
                .padding(.top, 100)
                .padding(.trailing, 50)
//                .padding(.bottom, 396)

            Spacer(minLength: 0)

            Button(action: {
                withAnimation {
                    if !self.devSelected { self.devSelected = true }
                    if self.hrSelected { self.hrSelected = false }
                }
                self.user.userType = .developer
                
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.devSelected ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))
                    HStack(alignment: .center) {
                        Text("👨‍💻")
                        .font(.system(size: 35))
                        
                        Text("iOS Developer")
                            .foregroundColor(.white)
                            .font(.custom("SFMono-Semibold", size: 20))
                        
                    }.padding(.leading, 18)
                    
                }
                
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
                .padding(.horizontal)
            
            Button(action: {
                withAnimation {
                    if self.devSelected { self.devSelected = false }
                    if !self.hrSelected { self.hrSelected = true }
                }
                self.user.userType = .hr
                self.user.developerLevel = nil
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.hrSelected ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))
                    HStack(alignment: .center) {
                        Text("🕵️‍♀️")
                        .font(.system(size: 35))
                        
                        Text("HR")
                            .foregroundColor(.white)
                            .font(.custom("SFMono-Semibold", size: 20))
                        
                    }.padding(.leading, 18)
                    
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
                .padding(.horizontal)

            Spacer(minLength: 0)
            
            Button(action: {
                if self.devSelected && !self.hrSelected { withAnimation{ self.secondQuestion = true } }
                if self.hrSelected && !self.devSelected { withAnimation{ self.user.mainScreen = true } }
            }, label: {
                ZStack(alignment: .center){
                    LinearGradient(gradient: .init(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .cornerRadius(50)
                    Text("Continue")
                        .font(.custom("SFMono-Regular", size: 20))
                        .foregroundColor(.white)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
                .padding(.horizontal)
            
            Spacer(minLength: 0)

            
        }

    }
}

struct OnboardingViewFirstQuestion_Previews: PreviewProvider {
    static var user = UserModel()
    
    static var previews: some View {
        Group {
            OnboardingViewFirstQuestion(secondQuestion: .constant(false)).environmentObject(user)
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            .previewDisplayName("iPhone SE (2nd generation)")
            
            OnboardingViewFirstQuestion(secondQuestion: .constant(true)).environmentObject(user)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
            
            OnboardingViewFirstQuestion(secondQuestion: .constant(false)).environmentObject(user)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            .previewDisplayName("iPhone 11 Pro")
            
            OnboardingViewFirstQuestion(secondQuestion: .constant(true)).environmentObject(user)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
