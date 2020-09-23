//
//  FlagsModel.swift
//  IOSDevJobs
//
//  Created by g01dt00th on 25.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import Foundation

enum Flags: String {
    case Russia = "🇷🇺"
    case USA = "🇺🇸"
    case Europe = "🇪🇺"
    case Belarus = "🇧🇾"
    case GreatBritain = "🇬🇧"
    case Germany = "🇩🇪"
    case Israel = "🇮🇱"
    case Kazakhstan = "🇰🇿"
    case Canada = "🇨🇦"
    case NewZealand = "🇳🇿"
    case Norway = "🇳🇴"
    case UAE = "🇦🇪"
    case SouthKorea = "🇰🇷"
    case Turkey = "🇹🇷"
    case Ukraine = "🇺🇦"
    case Switzerland = "🇨🇭"
    case Japan = "🇯🇵"
    case SAR = "🇿🇦"
    case UnknownCountry = "🏳️‍🌈"
    
    static func getFlag(from name: String) -> Flags {
        switch name.uppercased() {
            case "RUSSIA": return .Russia
            case "РОССИЯ": return .Russia
            case "USA": return .USA
            case "EUPORE": return .Europe
            case "BELARUS": return .Belarus
            case "GREATBRITAIN": return .GreatBritain
            case "GREAT BRITAIN": return .GreatBritain
            case "GREAT-BRITAIN": return .GreatBritain
            case "GERMANY": return .Germany
            case "ISRAEL": return .Israel
            case "KAZAKHSTAN": return .Kazakhstan
            case "CANADA": return .Canada
            case "NEWZEALAND": return .NewZealand
            case "NEW ZEALAND": return .NewZealand
            case "NEW-ZEALAND": return .NewZealand
            case "NORWAY": return .Norway
            case "UAE": return .UAE
            case "SOUTHKOREA": return .SouthKorea
            case "SOUTH KOREA": return .SouthKorea
            case "SOUTH-KOREA": return .SouthKorea
            case "TURKEY": return .Turkey
            case "UKRAINE": return .Ukraine
            case "SWITZERLAND": return .Switzerland
            case "JAPAN": return .Japan
            case "SAR": return .SAR
            
            default: return .UnknownCountry
        }
    }
}
