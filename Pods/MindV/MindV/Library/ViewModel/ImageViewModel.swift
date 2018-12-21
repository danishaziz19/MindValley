//
//  ImageViewModel.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import UIKit

class ImageViewModel {

    var api: API = API()

    func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        api.getData(from: url, dataType: .image) { (data, error) in

            if error != nil {
                completion(nil, error)
                return
            }

            if let data = data {
                let image = UIImage(data: data)
                completion(image, nil)
            }
        }
    }
}
