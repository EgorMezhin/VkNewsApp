//
//  NewsFeedCell.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

protocol FeedCellViewModel {
    var iconURLString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likeNumber: String? { get }
    var commentNumber: String? { get }
    var shareNumber: String? { get }
    var viewNumber: String? { get }
    
}

class NewsFeedCell: UITableViewCell{
    
    static let reuseIdentifier = "NewsFeedCell"
    
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageUrl: viewModel.iconURLString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likeLabel.text = viewModel.likeNumber
        commentLabel.text = viewModel.commentNumber
        shareLabel.text = viewModel.shareNumber
        viewLabel.text = viewModel.viewNumber
    }
}
