//
//  NSErrorExtension.swift
//  Project_Challenge
//
//  Created by Danish on 22/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

extension NSError {
    static func generalError(domain: String, comment: String) -> Error {
        return NSError(domain: domain, code: 0, userInfo: [NSLocalizedDescriptionKey : NSLocalizedString("Error", comment: comment)])
    }
}
