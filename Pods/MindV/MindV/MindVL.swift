//
//  MindVL.swift
//  MindV
//
//  Created by Danish on 20/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import UIKit

public class MindVL {

    private static var sharedInstance: MindVL!
    private var imageViewModel: ImageViewModel = ImageViewModel()
    private init() {

    }

    public static func shared(totalCostLimit:Int? = 10, countLimit:Int? = 10, isDiscardableContent:Bool? = false) -> MindVL {
        if sharedInstance != nil {
            return sharedInstance
        } else{
            sharedInstance = MindVL()
            return sharedInstance
        }
    }

    public static func setCacheLimt(totalCostLimit:Int? = 10, countLimit:Int? = 10, isDiscardableContent:Bool? = false) {
        CacheManager.setCacheLimt(totalCostLimit: totalCostLimit, countLimit: countLimit, isDiscardableContent: isDiscardableContent)
    }

    public func loadJsonAsDictionary(from url: URL, completion: @escaping ([Dictionary<String,Any>]?, Error?) -> Void) {
        JsonViewModel().loadJsonAsDictionary(from: url) { (json, error) in
            completion(json, error)
        }
    }

    public func loadJsonAsData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        JsonViewModel().loadJsonAsData(from: url) { (json, error) in
            completion(json, error)
        }
    }

    public func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        imageViewModel.loadImage(from: url) { (image, error) in
            completion(image, error)
        }
    }

    public func loadImage(from url: URL, imageView: UIImageView, placeHolder: String) {

        DispatchQueue.main.async() {
            imageView.image = UIImage(named: placeHolder)
        }

        imageViewModel.loadImage(from: url) { (image, error) in
            DispatchQueue.main.async() {
                if let image = image {
                    imageView.image = image
                } else {
                    imageView.image = UIImage(named: placeHolder)
                }
            }
        }
    }

    public func loadPDFFile(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        FileViewModel().loadPDFFile(from: url, dataType: .pdf) { (data, error) in
            completion(data, error)
        }
    }
}
