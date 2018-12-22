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

    var boardAPI: BoardAPI = BoardAPI()

    func getBoards(url: String, completion: @escaping ([BoardModel]?, Error?) -> Void) {
        boardAPI.getBoards(url: url) { (boardModels, error) in
            completion(boardModels, error)
        }
    }
}
