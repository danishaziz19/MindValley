//
//  Downloader.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

class Downloader {

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
       let session = self.getSession()
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

    func getSession()-> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig)
        return session
    }

    func cancelDownload(url: URL) {
        URLSession.shared.getAllTasks { sessions in
            if let session = sessions.first(where: {$0.currentRequest?.url == url}) {
                session.cancel()
            }
        }
    }
}
