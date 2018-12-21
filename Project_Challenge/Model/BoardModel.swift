//
//  BoardModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy


public struct BoardModel {
    var id: String?
    var likedByUser: Bool?
    var likes: Int?
    var width: Int?
    var height: Int?
    var createdAt: String?
    var color: String?
    var user: UserModel = UserModel()
    var urls: URLModel = URLModel()
    var links: LinkModel = LinkModel()
    var categories : [CategoryModel] = []
}

extension BoardModel: JSONDecodable {
    public init(json value: JSON) throws {

        let baseModel: BaseModel = BaseModel()
        self.id = baseModel.getStringValueFrom(json: value, for: "id")
        self.color = baseModel.getStringValueFrom(json: value, for: "color")
        self.createdAt = baseModel.getStringValueFrom(json: value, for: "created_at")
        self.likedByUser = baseModel.getBoolValueFrom(json: value, for: "liked_by_user")
        self.likes = baseModel.getIntValueFrom(json: value, for: "likes")
        self.width = baseModel.getIntValueFrom(json: value, for: "width")
        self.height = baseModel.getIntValueFrom(json: value, for: "height")

        self.user = try UserModel(json: value)
        self.urls = try URLModel(json: value)
        self.links = try LinkModel(json: value)

        if let categories = try value.getArray(at: "categories", alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
            self.categories =  try categories.map(CategoryModel.init)
        }
    }
}
