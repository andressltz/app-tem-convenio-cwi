//
//  UserType.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 26/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum UserType: String {
    case basic
    case manager
    
    var description: String {
        switch self {
        case .basic:
            return "Usuário Básico"
        case .manager:
            return "Usuário RH"
        }
    }
}
