//
//  VacancyListView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 17.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct VacancyListView: View {
    @EnvironmentObject var vlConnector: VacancyListConnector
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        NavigationView {
            if self.vlConnector.list.isEmpty {
                Text("Loading...")
                
            } else {
                ScrollView(showsIndicators: false) {
                    ForEach(self.vlConnector.list, id: \.id) { item in
                        NavigationLink(destination: VacancyItemDetailView(vacancy: item), label: {
                            VacancyItemView(vacancy: item)
                                .padding(.bottom, 18)
                        }).buttonStyle(PlainButtonStyle())
                    }
                }.navigationBarTitle(Text("Vacancies"))
            }
        }
    }
}

struct VacancyListView_Previews: PreviewProvider {
    static var user = UserModel()
    static var vlConnector = VacancyListConnector()
    
    static var previews: some View {
        Group {
            VacancyListView().environmentObject(user).environmentObject(vlConnector)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            VacancyListView().environmentObject(user).environmentObject(vlConnector)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            VacancyListView().environmentObject(user).environmentObject(vlConnector)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            VacancyListView().environmentObject(user).environmentObject(vlConnector)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
