//
//  VacancyContactsView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 26.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct VacancyContactsView: View {
    var contacts: [CompanyContact]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Contacts")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .padding(.leading)

            ForEach(contacts) { contact in
                ContactView(contact: contact)
            }
        }
    }
}

struct VacancyContactsView_Previews: PreviewProvider {
    static var contacts = [CompanyContact(id: "0",
                                   firstName: "Константин",
                                   lastName: "Смелов",
                                   phoneNumber: "+79013051810",
                                   jobTitle: "Руководитель отдела",
                                   avatarURL: "https://scontent.frix7-1.fna.fbcdn.net/v/t1.0-9/48370188_2164092757186194_3794202005098987520_n.png?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=XG2wUe9KpuQAX962mVx&_nc_oc=AQm4akzTLhpMT9VyXp_aMy_MPGKtYwQOWycRKNnRy9f9w5pFKdgDfbc2yJ4LpUb33iM&_nc_ht=scontent.frix7-1.fna&oh=4bca792131ce5a55732737ddbfb840b1&oe=5F6C5FD5",
                                   email: "smelov@tcmp.ru",
                                   telegram: "")
    , CompanyContact(id: "1", firstName: "Федор", lastName: "Николаев", phoneNumber: "+79117925904", jobTitle: "Коммерческий директор", avatarURL: "", email: "nikolaev@toolit.ru", telegram: "")]
    
    static var previews: some View {
        Group {
            VacancyContactsView(contacts: contacts)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE (2nd generation)")
            
            VacancyContactsView(contacts: contacts)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            VacancyContactsView(contacts: contacts)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            
            VacancyContactsView(contacts: contacts)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
