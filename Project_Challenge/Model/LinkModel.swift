//
//  LinkModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy

public struct LinkModel {
    var html: String?
    var likes: String?
    var photos: String?
    var selfLink: String?
    var download: String?
}

extension LinkModel: JSONDecodable {
    public init(json value: JSON) throws {

        let baseModel: BaseModel = BaseModel()
        self.html = baseModel.getStringValueFrom(json: value, for: "links", forkey2: "html")
        self.likes = baseModel.getStringValueFrom(json: value, for: "links", forkey2: "likes")
        self.photos = baseModel.getStringValueFrom(json: value, for: "links", forkey2: "photos")
        self.selfLink = baseModel.getStringValueFrom(json: value, for: "links", forkey2: "self")
        self.download = baseModel.getStringValueFrom(json: value, for: "links", forkey2: "download")
    }

    public init(jsonUser value: JSON) throws {

        let baseModel: BaseModel = BaseModel()
        self.html = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "links", forkey3: "html")
        self.likes = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "links", forkey3: "likes")
        self.photos = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "links", forkey3: "photos")
        self.selfLink = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "links", forkey3: "self")
        self.download = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "links", forkey3: "download")
    }

}
