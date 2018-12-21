//
//  CategoryModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy

public struct CategoryModel {
    var id: Int?
    var photoCount: Int?
    var title: String?
    var links: LinkModel = LinkModel()
}

extension CategoryModel: JSONDecodable {
    public init(json value: JSON) throws {

        let baseModel: BaseModel = BaseModel()
        self.id = baseModel.getIntValueFrom(json: value, for: "id")
        self.title = baseModel.getStringValueFrom(json: value, for: "title")
        self.photoCount = baseModel.getIntValueFrom(json: value, for: "photo_count")
        self.links = try LinkModel(json: value)

    }
}
