//
//  BoardTableViewCell.swift
//  Project_Challenge
//
//  Created by Danish on 21/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import Foundation
import UIKit
import MindV

internal class BoardTableViewCell: UITableViewCell {

    @IBOutlet weak var boardImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCell(boardModel: BoardModel) {
        self.likeLabel.text = String(format: "Like: %d", boardModel.likes ?? 0)
        self.sizeLabel.text = String(format: "Size: %d x %d", boardModel.width ?? 0, boardModel.height ?? 0)

        let titles = boardModel.categories.map({ $0.title })
        var categories: String = ""
        if titles.count > 1 {
            categories = titles.first as? String ?? ""
            for title in titles[1...titles.count - 1] {
                categories += String(format: ", %@", title ?? "")
            }
        } else {
            categories = titles.first as? String ?? ""
        }

        self.categoriesLabel.text = categories

        if let createdDate = boardModel.createdAt {
            let dateFormatter = DateFormatter()
            //2016-05-29T15:42:02-04:00
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            let date = dateFormatter.date(from: createdDate)
            self.createdAtLabel.text = date?.timeAgo(numericDates: true) ?? ""
        }

        if let thumb = boardModel.urls?.thumb {
            if let url = URL(string: thumb) {
                self.boardImageView.loadImage(from: url, placeHolder: "no_image_found")
            }
        }
    }
}
