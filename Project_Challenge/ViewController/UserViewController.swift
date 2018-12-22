//
//  UserViewController.swift
//  Project_Challenge
//
//  Created by Danish on 22/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    public var boardModel: BoardModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUp()
    }

    func setUp() {
        if let user = boardModel?.user {
            if let profileImage = user.profileImage?.large {
                if let url = URL(string: profileImage) {
                    self.userImageView.loadImage(from: url, placeHolder: "no_image_found")
                }
            }

            self.nameLabel.text = user.name
            self.userNameLabel.text = user.userName
        }
    }

}
