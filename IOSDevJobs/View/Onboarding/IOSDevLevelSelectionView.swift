//
//  IOSDevLevelSelectionView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct IOSDevLevelSelectionView: View {
    @EnvironmentObject var user: UserModel
    
//    @State private var selected = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("What is your level?")
                .font(.custom("SFMono-Bold", size: 36))
                .lineLimit(2)
                .padding(.top, UIScreen.main.bounds.height / 12)
                .padding(.bottom)
            
//            Spacer(minLength: 5)
            
            Button(action: {
                withAnimation {
                    self.user.developerLevel = .trainee
                }
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.user.developerLevel == .trainee ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                    Text("Just learning")
                        .foregroundColor(.white)
                        .font(.custom("SFMono-Semibold", size: 20))
                        .padding(.leading, 40)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            Button(action: {
                withAnimation {
                    self.user.developerLevel = .junior
                }
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.user.developerLevel == .junior ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                    Text("Junior")
                        .foregroundColor(.white)
                        .font(.custom("SFMono-Semibold", size: 20))
                        .padding(.leading, 40)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            Button(action: {
                withAnimation {
                    self.user.developerLevel = .middle
                }
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.user.developerLevel == .middle ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                    Text("Middle")
                        .foregroundColor(.white)
                        .font(.custom("SFMono-Semibold", size: 20))
                        .padding(.leading, 40)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            Button(action: {
                withAnimation {
                    self.user.developerLevel = .senior
                }
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.user.developerLevel == .senior ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                    Text("Senior")
                        .foregroundColor(.white)
                        .font(.custom("SFMono-Semibold", size: 20))
                        .padding(.leading, 40)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            Button(action: {
                withAnimation {
                    self.user.developerLevel = .teamLead
                }
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.user.developerLevel == .teamLead ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                    Text("Team lead")
                        .foregroundColor(.white)
                        .font(.custom("SFMono-Semibold", size: 20))
                        .padding(.leading, 40)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            Button(action: {
                withAnimation {
                    self.user.developerLevel = .chiefTechnicalOfficer
                }
            }, label: {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(self.user.developerLevel == .chiefTechnicalOfficer ? Color(#colorLiteral(red: 0.9808802009, green: 0.6028570533, blue: 0.0362229161, alpha: 1)) : Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                    Text("CTO")
                        .foregroundColor(.white)
                        .font(.custom("SFMono-Semibold", size: 20))
                        .padding(.leading, 40)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.user.mainScreen = true
            }, label: {
                ZStack(alignment: .center){
                    LinearGradient(gradient: .init(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .cornerRadius(50)
                    Text("Continue")
                        .font(.custom("SFMono-Regular", size: 20))
                        .foregroundColor(.white)
                }
            }).frame(width: UIScreen.main.bounds.width - 30, height: 50)
            
            Spacer(minLength: 0)
        }//.padding(.leading)
    }
}

struct IOSDevLevelSelectionView_Previews: PreviewProvider {
    static var user = UserModel()
    
    static var previews: some View {
        Group {
            IOSDevLevelSelectionView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            IOSDevLevelSelectionView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            IOSDevLevelSelectionView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            IOSDevLevelSelectionView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
