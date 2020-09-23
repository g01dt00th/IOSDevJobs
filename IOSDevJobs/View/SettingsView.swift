//
//  SettingsView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 17.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if user.userType == .hr {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))
                    HStack(alignment: .center) {
                        Text("🕵️‍♀️")
                        .font(.system(size: 35))
                        
                        Text("HR")
                            .foregroundColor(.white)
                            .font(.custom("SFMono-Semibold", size: 20))
                        
                    }.padding(.leading, 18)
                    
                }.frame(height: 50)
                .padding()
            }
            if user.userType == .developer {
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))
                        HStack(alignment: .center) {
                            Text("👨‍💻")
                            .font(.system(size: 35))
                            
                            Text("iOS Developer")
                                .foregroundColor(.white)
                                .font(.custom("SFMono-Semibold", size: 20))
                            
                        }.padding(.leading, 18)
                        
                    }.frame(height: 50)
                        .padding()
                    
                    if self.user.developerLevel != nil {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.7425357699, green: 0.7458527684, blue: 0.7496563792, alpha: 1)))

                        Text(LocalizedStringKey(stringLiteral: self.user.developerLevel!.rawValue))
                            .foregroundColor(.white)
                            .font(.custom("SFMono-Semibold", size: 20))
                            .padding(.leading, 40)
                    }.frame(height: 50)
                        .padding(.horizontal)
                    }
                }
            }
            
            
            
            Spacer()
           

        }.frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
        .navigationBarTitle(Text("About me").font(.custom("SFMono-Bold", size: 34)))
            .onTapGesture {
                withAnimation { self.clearUserDefaults() }
        }

    }
    
    func clearUserDefaults(){
        user.userType = nil
        user.developerLevel = nil
        
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "UserType")
        defaults.set(nil, forKey: "DeveloperLevel")
        if defaults.synchronize() { print("\nUserDefaults keys was cleared!\n") }
        
        user.mainScreen = false
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var user = UserModel()
    
    static var previews: some View {
        SettingsView().environmentObject(user)
    }
}
