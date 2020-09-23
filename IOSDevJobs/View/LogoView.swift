//
//  LogoView.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 11.09.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    var image: UIImage?
    var flag: String
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer(minLength: 0)
            
            if image != nil {
                VStack {
                    Spacer().frame(height: 35)
                    ZStack {
                        Image(uiImage: image!)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width, height: 180)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.orange)
                                .frame(width: 77, height: 77)
                            Text(flag)
                                .font(.system(size: 60))
                                .shadow(radius: 5)
                        }.offset(y: 85)
                    }
                }
            }  else {
                VStack {
                    Spacer().frame(height: 45)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.orange)
                            .frame(width: 77, height: 77)
                        Text(flag)
                            .font(.system(size: 60))
                            .shadow(radius: 5)
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.bottom, 20)
    }
}
struct LogoView_Previews: PreviewProvider {
    static var image = UIImage(named: "back")
    
    static var previews: some View {
        
        Group {
            LogoView(image: image, flag: "🇷🇺")
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
//            LogoView(image: image, flag: "🇷🇺")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//
//            LogoView(image: image, flag: "🇷🇺")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
//                .previewDisplayName("iPhone 11 Pro")
//
//            LogoView(image: image, flag: "🇷🇺")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
//                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
