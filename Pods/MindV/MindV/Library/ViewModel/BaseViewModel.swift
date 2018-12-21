//
//  BaseViewModel.swift
//  MindV
//
//  Created by Danish on 21/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

class BaseViewModel {

    var api: API = API()

    func cancelDownload(from url: URL) {
        api.cancelDownload(from: url)
    }
}
