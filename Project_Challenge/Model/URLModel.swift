//
//  URLModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy

public struct URLModel {
    var full: String?
    var raw: String?
    var regular: String?
    var small: String?
    var thumb: String?
}

extension URLModel: JSONDecodable {
    public init(json value: JSON) throws {

        let baseModel: BaseModel = BaseModel()
        self.full = baseModel.getStringValueFrom(json: value, for: "urls", forkey2: "full")
        self.raw = baseModel.getStringValueFrom(json: value, for: "urls", forkey2: "raw")
        self.regular = baseModel.getStringValueFrom(json: value, for: "urls", forkey2: "regular")
        self.small = baseModel.getStringValueFrom(json: value, for: "urls", forkey2: "small")
        self.thumb = baseModel.getStringValueFrom(json: value, for: "urls", forkey2: "thumb")
    }
}
