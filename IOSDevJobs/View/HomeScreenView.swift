//
//  HomeScreenView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 30.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        TabView {
            VacancyListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            MenuView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }.onAppear(perform: saveUserData)
    }
    
    func saveUserData(){
        let defaults = UserDefaults.standard
        switch user.userType {
        case .developer:
            defaults.set("developer", forKey: "UserType")
            print("\ndeveloper as UserType data was set successfully\n")
            let level = user.developerLevel?.rawValue ?? ""
            defaults.set(level, forKey: "DeveloperLevel")
            print("\n\(level)  as DeveloperLevel data was set successfully\n")
        case .hr:
            defaults.set("hr", forKey: "UserType")
            defaults.set(nil, forKey: "DeveloperLevel")
            print("\nhr as UserType data was set successfully\n")
        default:
            break
        }
        if defaults.synchronize() { print("\nUserDefaults keys was synchronised!\n") }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var user = UserModel()
    
    static var previews: some View {
        Group {
            HomeScreenView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            HomeScreenView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            HomeScreenView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            HomeScreenView().environmentObject(user)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
