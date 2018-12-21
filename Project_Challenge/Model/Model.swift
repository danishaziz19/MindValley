//
//  Model.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy

class Model {

    func getBoards(url: String, completion: @escaping ([BoardModel]?, Error?) -> Void) {
        BoardAPI().getBoards(url: url) { (boardModels, error) in
            completion(boardModels, error)
        }
    }
}
