//
//  EstablishmentsListContract.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 01/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol EstablishmentsListViewType: AnyObject {
    func reloadData()
}

protocol EstablishmentListPresenterType: UITableViewDataSource {
    var view: EstablishmentsListViewType? { get set }
    
    func fetchData()
}
