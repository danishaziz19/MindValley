//
//  JsonViewModel.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

class JsonViewModel {

    var api: API = API()

    func loadJsonAsData(from url: URL, completion: @escaping (Data? , Error?) -> Void) {
        API().getData(from: url, dataType: .json) { (data, error) in

            if error != nil {
                completion(nil, error)
            }

            if let jsonData = data {
                completion(jsonData, nil)
            }
        }
    }

    func loadJsonAsDictionary(from url: URL, completion: @escaping ([Dictionary<String,Any>]?, Error?) -> Void) {
        api.getData(from: url, dataType: .json) { (data, error) in

            if error != nil {
                completion(nil, error)
                return
            }

            if let jsonData = data {
                do {
                    // Convert NSData to Dictionary where keys are of type String, and values are of any type
                    let json = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<Dictionary< String, Any>>
                    print(json)
                    completion(json, nil)
                } catch {
                    // Something went wrong
                    completion(nil, NSError(domain: url.absoluteString, code: 400, userInfo: [NSLocalizedDescriptionKey : NSLocalizedString("General Parsing Error Description", comment: "General Parsing Error Description")]))
                }
            }
        }
    }
}
