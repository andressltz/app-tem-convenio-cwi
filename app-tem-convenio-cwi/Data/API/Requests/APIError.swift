    //
//  RequestMakerError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum APIError: BaseError {
    
    case noInternetConnection
    case missingParams
    case requestFailed
    case invalidData
    case decodingFailed
    
    var title: String {
        switch self {
        case .noInternetConnection:
            return "Erro de conexão"
        case .missingParams:
            return "Faltam Parâmetros!"
        case .requestFailed:
            return "Erro na Requisição!"
        case .invalidData:
            return "Dados Inválidos!"
        case .decodingFailed:
            return "Erro ao Decodificar!"
        }
    }
    
    var message: String {
        switch self {
        case .noInternetConnection:
            return "Por favor confira sua conexão com a internet."
        case .missingParams:
            return "Por favor, informe todos os parâmetros."
        case .requestFailed:
            return "Ocorreu um erro na requisição, tente novamente."
        case .invalidData:
            return "Por favor, verifique os dados informados"
        case .decodingFailed:
            return "Ocorreu um erro na decodificação, tente novamente."
        }
    }
    
}
