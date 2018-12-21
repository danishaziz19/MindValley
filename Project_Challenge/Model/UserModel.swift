//
//  UserModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy


public struct UserModel {
    var id: String?
    var userName: String?
    var name: String?
    var profileImage: ProfileImageModel = ProfileImageModel()
    var links: LinkModel = LinkModel()
}

extension UserModel: JSONDecodable {
    public init(json value: JSON) throws {

        let baseModel: BaseModel = BaseModel()
        self.id = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "id")
        self.name = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "name")
        self.userName = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "username")

        self.profileImage = try ProfileImageModel(json: value)
        self.links = try LinkModel(jsonUser: value)

    }
}
