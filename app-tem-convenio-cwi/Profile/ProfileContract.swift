//
//  ProfileContract.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 03/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol ProfileViewType: AnyObject {
    func loadData(user: User?)
}

protocol ProfilePresenterType {
    func fetchData()
}
