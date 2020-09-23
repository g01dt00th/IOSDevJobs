//
//  VacancyItemDetailView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 17.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct VacancyItemDetailView: View {
    @State private var logoImage: UIImage? = nil
    @State private var contacts: VacancyContactsView? = nil
    var vacancy: VacancyModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                LogoView(image: logoImage, flag: Flags.getFlag(from: vacancy.country).rawValue)
                
                Group {
                    Text(vacancy.vacancyTitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(50)
                        .padding(.bottom, 10)
                    
                    
                    
                    Text(vacancy.companyName)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .lineLimit(50)
                        .padding()
                    
                    
                    
                    
                    Text(vacancy.salary)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .lineLimit(50)
                    
                    Divider()
                    
                    HStack {
                        Text("Development language:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.devLanguage)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding(.bottom, 5)
                    
                    HStack {
                        Text("Country:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.country)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding(.bottom, 5)
                    
                    HStack {
                        Text("City:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.city)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding(.bottom, 5)
                    
                    HStack {
                        Text("Relocation option:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.relocateIsNeeded ? "is provided" : "not provided")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding(.bottom, 5)
                    
                    
                    HStack {
                        Text("Work place:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.workPlace)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding(.bottom, 5)
                    
                    HStack {
                        Text("Schedule:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.schedule)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding(.bottom, 5)
                }.padding(.leading)
                
                Group {
                    Text(vacancy.typeOfEmployment)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(50)
                        .padding(.bottom, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Description:")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding(.bottom, 5)
                        
                        ForEach(vacancy.vacancyDescription, id: \.self) { line in
                            Text(line)
                                .lineLimit(50)
                                .padding()
                            
                        }
                    }.padding()
                    
                    HStack {
                        Text("Company site:")
                        Button(action: {
                            if let url = URL(string: self.vacancy.companySiteURL) {
                                UIApplication.shared.open(url)
                            }
                        }, label: {
                            Text(vacancy.companySiteURL).lineLimit(50)
                        })
                    }.padding(.bottom)
                    
                    
                    ChipsView(items: vacancy.tags)
//                    VacancyContactsView(contacts: vacancy.companyContacts)

                    contacts


                    
                    HStack {
                        Text("Job posting date:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Text(vacancy.dateOfVacancy)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(50)
                    }.padding()
                    
                }.padding(.leading)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            if !self.vacancy.companyIconURL.isEmpty {
                DispatchQueue.main.async {
                    if let logo = UIImage().fetchImage(from: self.vacancy.companyIconURL) {
                        self.logoImage = logo
                    }
                }
            }
            DispatchQueue.main.async {
                self.contacts = VacancyContactsView(contacts: self.vacancy.companyContacts)
            }
        }

    }
}



struct VacancyItemDetailView_Previews: PreviewProvider {
    static var vacancy = VacancyModel(id: "0",
                                      vacancyTitle: "Монтажник слаботочных сетей",
                                      companyName: "ТехноКомплект",
                                      companyIconURL: "http://www.tcmp.ru",
                                      salary: "от 35000 на руки",
                                      devLanguage: "СКС, СКД, CCTV",
                                      workPlace: "Санкт-Петербург",
                                      schedule: "Полный день",
                                      country: "Россия",
                                      city: "Санкт-Петербург",
                                      relocateIsNeeded: false,
                                      typeOfEmployment: "Полная занятость",
                                      vacancyDescription: ["Обязанности: Монтаж слаботочных систем:  охранно-пожарных систем; систем видеонаблюдения; СОУЭ; СКУД; СКС; Диспетчеризация.",
                                                           "Требования:  Знание слаботочных систем: АПС, СКУД, СОУЭ, СКС, охранная сигнализация, видеонаблюдение; Умение обращаться с ручным и электроинструментом; Умение читать чертежи; Готовность к обучению; Приветствуется опыт проведения пусконаладочных работ; Отсутствие медицинских противопоказаний к работе.",
                                                           "Условия: Оформление по ТК, испытательный срок 3 месяца; Предоставляется электроинструмент, спецодежда; Полный рабочий день; Заработная плата по результатам собеседования;"],
                                      companySiteURL: "http://tcmp.ru/images/tcmp-1x1.jpg",
                                      tags: ["слаботочка",
                                             "электромонтаж",
                                             "СКС"],
                                      companyContacts: [CompanyContact(id: "0",
                                                                       firstName: "Константин",
                                                                       lastName: "Смелов",
                                                                       phoneNumber: "+79013051810",
                                                                       jobTitle: "Руководитель отдела",
                                                                       avatarURL: "https://scontent.frix7-1.fna.fbcdn.net/v/t1.0-9/48370188_2164092757186194_3794202005098987520_n.png?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=XG2wUe9KpuQAX962mVx&_nc_oc=AQm4akzTLhpMT9VyXp_aMy_MPGKtYwQOWycRKNnRy9f9w5pFKdgDfbc2yJ4LpUb33iM&_nc_ht=scontent.frix7-1.fna&oh=4bca792131ce5a55732737ddbfb840b1&oe=5F6C5FD5",
                                                                       email: "smelov@tcmp.ru",
                                                                       telegram: "")
                                        , CompanyContact(id: "1", firstName: "Федор", lastName: "Николаев", phoneNumber: "+79117925904", jobTitle: "Коммерческий директор", avatarURL: "", email: "nikolaev@toolit.ru", telegram: "")],
                                      dateOfVacancy: "25/08/2020",
                                      vacancyWasAddedToFavorites: "")
    
    static var previews: some View {
        Group {
            VacancyItemDetailView(vacancy: vacancy)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            VacancyItemDetailView(vacancy: vacancy)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            VacancyItemDetailView(vacancy: vacancy)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            VacancyItemDetailView(vacancy: vacancy)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}

