//
//  ContactView.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 26.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    @State private var logoImage: UIImage? = nil
    @State private var showActions = false
    var contact: CompanyContact
    
    var body: some View {
        HStack {
            
            if self.logoImage != nil {
                Image(uiImage: logoImage!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 44, height: 44)
            } else {
                ZStack {
                    Circle()
                        .foregroundColor(.orange)
                        .frame(width: 44, height: 44)
                    HStack(spacing: 1) {
                        Text(String(self.contact.firstName.first!))
                        Text(String(self.contact.lastName.first!))
                    }.foregroundColor(.white)
                }
            }
            
            VStack(alignment: .leading) {
                
                Text(self.contact.firstName + " " + self.contact.lastName)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Text(self.contact.jobTitle)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(.secondary)
                .frame(width: 5, height: 10)
                .padding()
            
            
            
        }
        .padding(.horizontal)
        .onTapGesture {
            self.showActions.toggle()
        }
        .actionSheet(isPresented: self.$showActions){
            var buttons = [ActionSheet.Button]()
            
            if !self.contact.phoneNumber.isEmpty {
                buttons.append(.default(Text("Call")) {
                    if let url = URL(string: "tel:"+self.contact.phoneNumber) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                })
            }
            
            if !self.contact.email.isEmpty {
                buttons.append(.default(Text(self.contact.email)) {
                    if let url = URL(string: "mailto:"+self.contact.email) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                })
            }
            
            if !self.contact.telegram.isEmpty {
                buttons.append(.default(Text("Telegram")) {
                    if let url = URL(string: "tg://resolve?domain="+self.contact.telegram) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                })
            }
            
            buttons.append(.cancel())
            
            return ActionSheet(title: Text(contact.firstName + " " + contact.lastName), message: nil, buttons: buttons)
        }
        .onAppear {
            if !self.contact.avatarURL.isEmpty {
                DispatchQueue.main.async {
                    self.logoImage = UIImage().fetchImage(from: self.contact.avatarURL)
                }
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: CompanyContact(id: "0",
        firstName: "Константин",
        lastName: "Смелов",
        phoneNumber: "+79013051810",
        jobTitle: "Руководитель отдела",
        avatarURL: "https://scontent.frix7-1.fna.fbcdn.net/v/t1.0-9/48370188_2164092757186194_3794202005098987520_n.png?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=XG2wUe9KpuQAX962mVx&_nc_oc=AQm4akzTLhpMT9VyXp_aMy_MPGKtYwQOWycRKNnRy9f9w5pFKdgDfbc2yJ4LpUb33iM&_nc_ht=scontent.frix7-1.fna&oh=4bca792131ce5a55732737ddbfb840b1&oe=5F6C5FD5",
        email: "smelov@tcmp.ru",
        telegram: ""))
    }
}
