//
//  RequestMaker.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftyJSON

class RequestsHandler {
    
    var ref: DatabaseReference!
    let reachability = Reachability()
    
    init() {
        ref = Database.database().reference()
    }
    
    func make(withEndpoint endpoint: Endpoint, withParams params: [String: Any?]? = nil, completion: @escaping CompletionCallback) {
        guard reachability.isConnectedToNetwork() else {
            completion(.failure(.noInternetConnection))
            return
        }
        var databaseRef = self.ref.child(endpoint.url)
        switch endpoint.httpMethod {
        case .post:
            databaseRef = databaseRef.childByAutoId()
            guard var params = params else {
                completion(.failure(.missingParams))
                return
            }
            guard let uid = databaseRef.key else {
                completion(.failure(.invalidData))
                return
            }
            params["uid"] = uid 
            databaseRef.setValue(params, withCompletionBlock: ({ (error, _) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    completion(.failure(.requestFailed))
                    return
                }
                completion(.success(JSON(params)))
            }))
        case .delete:
            databaseRef.setValue(nil, withCompletionBlock: ({ (error, _) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    completion(.failure(.requestFailed))
                    return
                }
                completion(.success(nil))
            }))
        case .patch:
            guard let params = params else {
                completion(.failure(.missingParams))
                return
            }
            databaseRef.setValue(params, withCompletionBlock: ({ (error, _) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    completion(.failure(.requestFailed))
                    return
                }
                completion(.success(JSON(params)))
            }))
        case .get:
            databaseRef.observeSingleEvent(of: .value) { (snapshot) in
                if let response = snapshot.value {
                    let json = JSON(response)
                    completion(.success(json))
                } else {
                    completion(.failure(.invalidData))
                }
            }
        }
    }
}
