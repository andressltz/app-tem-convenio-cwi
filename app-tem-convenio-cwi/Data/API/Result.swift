//
//  Result.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation
import SwiftyJSON

#if swift(>=5.0)
#else
enum Result<Success, Failure> where Failure : Error {
    
    /// A success, storing a `Success` value.
    case success(Success)
    
    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
#endif

typealias RequestResult = Result<JSON?, APIError>
typealias CompletionCallback = (RequestResult) -> Void

typealias StorageResult = Result<String, StorageError>
typealias StorageCompletionCallback = (StorageResult) -> Void
