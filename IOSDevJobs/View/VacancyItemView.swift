//
//  VacancyItemView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 17.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct VacancyItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var fav = Bool.random()
    
    var vacancy: VacancyModel
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(colorScheme == .dark ? .secondary : .white)
                .shadow(radius: 20)
            
            HStack {
//                Image("russianFlag")
//                    .resizable()
//                    .renderingMode(.original)
//                    .frame(width: 32, height: 32)
//                    .padding(10)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                    Text(Flags.getFlag(from: vacancy.country).rawValue)
                        .font(.system(size: 35))
                }
                
                VStack(alignment: .leading) {
                    Text(vacancy.vacancyTitle)
                        .font(.custom("SFMono-Semibold", size: 18))
                        .lineLimit(2)
                        .padding(.bottom, 5)
                    Text(vacancy.companyName)
                        .font(.custom("SFMono-Medium", size: 14))
                        .opacity(0.6)
                }
                
                Spacer(minLength: 0)
                Image(systemName: fav ? "star.fill" : "star").foregroundColor(self.fav ? .yellow : .primary ).padding()
                    .onTapGesture {
                        self.fav.toggle()
                }
            }.padding(.horizontal, 10)
            
        }.frame(height: 120)
            .padding(.horizontal, 18)
    }
}

struct VacancyItemView_Previews: PreviewProvider {
    static var previews: some View {
        VacancyItemView(vacancy: .init(id: "1", vacancyTitle: "Principal Software Engineer", companyName: "Apple", companyIconURL: "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png", salary: "$200.000/year", devLanguage: "Swift", workPlace: "Apple campus", schedule: "Onsite/Remote Full time", country: "USA", city: "Cupertino/Santa-Clara", relocateIsNeeded: true, typeOfEmployment: "40h per week", vacancyDescription:[ "bla-bla-bla", "bla-bla-bla", "bla-bla-bla", "bla-bla-bla"], companySiteURL: "https://www.apple.com", tags: ["iOS", "SWIFT", "Apple"], companyContacts: [], dateOfVacancy: "21/07/2020 23:22 test date/time", vacancyWasAddedToFavorites: "2 time(s)"))
    }
}
