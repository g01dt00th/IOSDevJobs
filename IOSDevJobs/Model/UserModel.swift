//
//  UserModel.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import Foundation

final class UserModel: ObservableObject {
    @Published var userType: UserTypeModel?
    @Published var developerLevel: DeveloperLevelModel?
    @Published var mainScreen = false


    enum UserTypeModel: String {
        case developer = "iOS Developer"
        case hr = "HR"
    }

    enum DeveloperLevelModel: String {
        case trainee = "Trainee"
        case junior = "Junior"
        case middle = "Middle"
        case senior = "Senior"
        case teamLead = "Team lead"
        case chiefTechnicalOfficer = "CTO"
    }


}


