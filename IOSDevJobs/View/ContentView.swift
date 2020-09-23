//
//  ContentView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserModel

    var body: some View {
        VStack{
            if self.user.mainScreen {
                HomeScreenView()
            } else {
                OnboardingView()
            }
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var user = UserModel()
    
    static var previews: some View {
        Group {
            ContentView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            ContentView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            ContentView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            ContentView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
