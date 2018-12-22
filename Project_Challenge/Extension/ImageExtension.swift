//
//  ImageExtension.swift
//  Project_Challenge
//
//  Created by Danish on 22/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import UIKit
import MindV

extension UIImageView {

    func loadImage(from url: URL, placeHolder: String) {
         DispatchQueue.global(qos: .background).async {
            MindVL.shared().loadImage(from: url, imageView: self, placeHolder: placeHolder)
        }
    }
}
