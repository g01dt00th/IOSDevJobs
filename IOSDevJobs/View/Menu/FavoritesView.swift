//
//  FavoritesView.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 10.09.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    HStack(alignment: .top, spacing: 1) {
                        Image("alina")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .padding(.vertical)
                            .padding(.leading, 10)
                        
                        VStack(alignment: .leading) {
                            Text("Alina Mikhaylova")
                                .font(.custom("SFMono-Semibold", size: 20))
                                .foregroundColor(.black)
                            Text("How can I make this app better?\nShare your feedback")
                                .font(.custom("SFMono-Regular", size: 15))
                                .lineLimit(5)
                                .foregroundColor(.gray)
                                .padding(7)
                            
                            Button(action: {
                                if let url = URL(string: "tg://resolve?domain=malina812") {
                                    if UIApplication.shared.canOpenURL(url) {
                                        UIApplication.shared.open(url)
                                    }
                                }
                            }, label: {
                                Text("@malina812")//.padding()
                            })
                        }//.padding()
                    }
                }.frame(height: 200)
                
                .padding()
                
                Spacer()
                
            }
        }.navigationBarTitle(Text("Contact Developer").font(.custom("SFMono-Bold", size: 34)))
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
