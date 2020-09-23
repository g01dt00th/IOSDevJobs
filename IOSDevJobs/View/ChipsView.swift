//
//  ChipsView.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 26.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct ChipsView: View {
    var items: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<items.count, id: \.self) { index in
                    
                    Text(self.items[index])
                        .font(.footnote)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .padding(.all, 10)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .clipShape(Capsule())
                }
            }
        }
    }
}

struct ChipsView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsView(items: ["tag 1", "tag 2", "tag 3", "неведомый тэг"])
    }
}
