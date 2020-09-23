//
//  MenuView.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 10.09.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @State private var showWeb = false
    
    private var menu: [MenuModel] = [MenuModel(icon: "💬", description: "About me"),
                                        MenuModel(icon: "📝", description: "Deploy vacancy"),
                                        MenuModel(icon: "👩🏻‍💻", description: "Contact developer")]

    var body: some View {
        NavigationView {
            
            VStack(spacing: 10) {
                
                NavigationLink(destination: SettingsView()) {
                    MenuItemView(item: menu[0])
                        .padding(.bottom)
                }

                MenuItemView(item: menu[1])
                    .padding(.bottom)
                    .sheet(isPresented: $showWeb, content: { WebView(url: "https://forms.gle/f1SEG8kQCcEAxVTCA") })
                    .onTapGesture {
                        self.showWeb.toggle()
                    }


                NavigationLink(destination: FavoritesView()) {
                    MenuItemView(item: menu[2])
                        .padding(.bottom)
                }
                
                //SignInWithApple()

                Spacer()
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 20, height: 20)
                    .contextMenu {
                        Text("Created by g01dt00th\n  Any questions?")
                        Button(action: {
                            if let url = URL(string: "tg://resolve?domain=g01dt00th") {
                                if UIApplication.shared.canOpenURL(url) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }, label: {
                            Text("Contact me on Telegram")
                                .foregroundColor(.blue)
                        })
                }
                Spacer()
                
            }.navigationBarTitle("More")
            
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
//        Group {
//            MenuView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
//                .previewDisplayName("iPhone SE (2nd generation)")
//
//            MenuView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//
//            MenuView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
//                .previewDisplayName("iPhone 11 Pro")
//
//            MenuView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
//                .previewDisplayName("iPhone 11 Pro Max")
//        }
    }
}
