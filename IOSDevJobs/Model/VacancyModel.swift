//
//  VacancyModel.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import Foundation

struct CompanyContact: Identifiable, Codable, Hashable {
    let id: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let jobTitle: String
    let avatarURL: String
    let email: String
    let telegram: String
}

struct VacancyModel: Identifiable, Codable {
    var id: String
    var vacancyTitle: String
    var companyName: String
    var companyIconURL: String
    var salary: String
    var devLanguage: String
    var workPlace: String
    var schedule: String
    var country: String
    var city: String
    var relocateIsNeeded: Bool
    var typeOfEmployment: String
    var vacancyDescription: [String]
    var companySiteURL: String
    var tags: [String]
    var companyContacts: [CompanyContact]
    var dateOfVacancy: String
    var vacancyWasAddedToFavorites: String
}
