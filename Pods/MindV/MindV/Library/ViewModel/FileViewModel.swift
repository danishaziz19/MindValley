//
//  FileViewModel.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

class FileViewModel {

    var api: API = API()

    func loadPDFFile(from url: URL,dataType: DataType, completion: @escaping (Data?, Error?) -> Void) {
         api.getData(from: url, dataType: dataType) { (data, error) in

            if error != nil {
                completion(nil, error)
                return
            }

            completion(data, nil)

        }
    }
}
