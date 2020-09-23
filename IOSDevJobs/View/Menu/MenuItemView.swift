//
//  MenuItemView.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 10.09.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI



struct MenuItemView: View {
    var item: MenuModel
    
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            ZStack {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.orange)
                Text(item.icon)
                    .font(.system(size: 30))
                    .padding(5)
            }
            VStack {
                HStack {
                    Text(LocalizedStringKey(stringLiteral: self.item.description))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                    
                    
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 5, height: 10)
                    
                    
                }.padding(.vertical)
                Rectangle()
                    .foregroundColor(Color.primary.opacity(0.2))
                    .frame(height: 1)

                    
            }
        }.padding(.horizontal)
    }
}


struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: MenuModel(icon: "👩‍💻", description: "About me"))
    }
}
