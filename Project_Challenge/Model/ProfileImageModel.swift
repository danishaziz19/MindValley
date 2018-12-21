//
//  ProfileImageModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy

public struct ProfileImageModel {
    var small: String?
    var medium: String?
    var large: String?
}

extension ProfileImageModel: JSONDecodable {
    public init(json value: JSON) throws {
        
        let baseModel: BaseModel = BaseModel()
        self.small = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "profile_image", forkey3: "small")
        self.medium = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "profile_image", forkey3: "medium")
        self.large = baseModel.getStringValueFrom(json: value, for: "user", forkey2: "profile_image", forkey3: "large")
    }
}
