//
//  CacheManager.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import UIKit

fileprivate let dataCache = NSCache<NSString, NSData>()

class CacheManager {

    private static var sharedInstance: CacheManager!

    private init() {

    }
    
    static func shared() -> CacheManager {

        if sharedInstance != nil {
            return sharedInstance
        } else {
            sharedInstance = CacheManager()
            return sharedInstance
        }
    }

    static func setCacheLimt(totalCostLimit:Int? = 10, countLimit:Int? = 10, isDiscardableContent:Bool? = false) {

        if let totalCostLimit = totalCostLimit {
            dataCache.totalCostLimit = totalCostLimit
        }
        if let countLimit = countLimit {
            dataCache.countLimit = countLimit
        }
        if let isDiscardableContent = isDiscardableContent {
            dataCache.evictsObjectsWithDiscardedContent = isDiscardableContent
        }
    }

    func setDataObject(data: NSData, forKey key:NSString){
        dataCache.setObject(data, forKey: key)
    }

    func getDataObject(forKey key: NSString) -> NSData?{
        return dataCache.object(forKey: key)
    }
}
