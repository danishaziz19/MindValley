//
//  BaseModel.swift
//  Project_Test
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import Freddy

class BaseModel {
    
    func getStringValueFrom(json values: JSON, for key: String, forkey2 key2: String? = nil, forkey3 key3: String? = nil) ->String? {
        do {
            if let key2 = key2 {
                if let key3 = key3 {
                    if let value = try values.getString(at: key, key2, key3, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                        return value
                    }
                }
                else {
                    if let value = try values.getString(at: key, key2, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                        return value
                    }
                }
            } else {
                if let value = try values.getString(at: key, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                    return value
                }
            }
        } catch {
            return nil
        }
        return nil
    }

    func getIntValueFrom(json values: JSON, for key: String, forkey2 key2: String? = nil, forkey3 key3: String? = nil) ->Int? {
        do {
            if let key2 = key2 {
                if let key3 = key3 {
                    if let value = try values.getInt(at: key, key2, key3, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                        return value
                    }
                }
                else {
                    if let value = try values.getInt(at: key, key2, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                        return value
                    }
                }
            } else {
                if let value = try values.getInt(at: key, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                    return value
                }
            }
        } catch {
            return nil
        }

        return nil
    }

    func getBoolValueFrom(json values: JSON, for key: String, forkey2 key2: String? = nil) ->Bool? {
        do {
            if let key2 = key2 {
                if let value = try values.getBool(at: key, key2, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                    return value
                }
            } else {
                if let value = try values.getBool(at: key, alongPath: [.nullBecomesNil, .missingKeyBecomesNil]) {
                    return value
                }
            }
        } catch {
            return nil
        }

        return nil
    }

//    func getDateValueFrom(representation: AnyObject, for key:String) ->Date? {
//        if let value = representation[key] as? String{
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//            let date: Date? = dateFormatter.date(from: value)
//            return date
//        }
//        return nil
//    }
//
//    func getColorValueFrom(representation: AnyObject, for key:String) ->UIColor? {
//        if let hexValue = representation[key] as? String{
//            var cString:String = hexValue.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//            if (cString.hasPrefix("#")) {
//                cString.remove(at: cString.startIndex)
//            }
//
//            if ((cString.count) != 6) {
//                return UIColor.gray
//            }
//
//            var rgbValue:UInt32 = 0
//            Scanner(string: cString).scanHexInt32(&rgbValue)
//
//            return UIColor(
//                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//                alpha: CGFloat(1.0)
//            )
//        }
//        return nil
//    }
}
