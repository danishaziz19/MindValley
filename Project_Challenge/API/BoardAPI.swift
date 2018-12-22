//
//  BoardAPI.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy
import MindV

class BoardAPI {

    func getBoards(url: String, completion: @escaping ([BoardModel]?, Error?) -> Void) {
        if let url = URL(string: url) {
            MindVL.shared().loadJsonAsData(from: url) { (response, error) in
                if error != nil {
                    completion(nil, error)
                    return
                }
                
                do {
                    if let response = response {
                        let json = try JSON(data: response)
                        let boardModels = try json.getArray().map(BoardModel.init)
                        completion(boardModels, nil)
                    }
                } catch {

                    completion(nil, NSError.generalError(domain: url.absoluteString, comment: "Json parsing error"))
                }
            }
        } else {
             completion(nil, NSError.generalError(domain: "Invalid URL", comment: "Invalid URL"))
        }
    }
}


