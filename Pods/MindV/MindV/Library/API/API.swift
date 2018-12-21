//
//  API.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

class API {

    var downloader: Downloader = Downloader()
    
    func getData(from url: URL, dataType: DataType, completion: @escaping (Data?, Error?) -> Void) {

        if let cacheData = CacheManager.shared().getDataObject(forKey: url.absoluteString as NSString) {
            completion(cacheData as Data, nil)
            return
        }

       downloader.getData(from: url) { (data, response, error) in
            if dataType == DataType.json || dataType == DataType.image {
                if let data = data {
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                             CacheManager.shared().setDataObject(data: data as NSData, forKey: url.absoluteString as NSString)
                        }
                    }
                }
            }
            completion(data, error)
        }
    }

    func cancelDownload(from url: URL) {
        downloader.cancelDownload(url: url)
    }
}
