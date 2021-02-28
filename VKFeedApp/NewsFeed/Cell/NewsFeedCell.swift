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
    var photoAttachment: FeedCellPhotoAttachmentViewModel? { get }
    var sizes: FeedCellSizes { get }

}

protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomViewFrame: CGRect { get }
    var totalHeight: CGFloat { get }
    var moreTextButtonFrame: CGRect { get }
}

protocol FeedCellPhotoAttachmentViewModel {
    var photoUrlString: String? { get }
    var width: Int { get }
    var height: Int { get }
}


class NewsFeedCell: UITableViewCell{
    
    static let reuseIdentifier = "NewsFeedCell"
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var postImageView: WebImageView!
    @IBOutlet weak var bottomView: UIView!
    
    override func prepareForReuse() {
        iconImageView.set(imageUrl: nil)
        postImageView.set(imageUrl: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView?.layer.cornerRadius = iconImageView.frame.width / 2
        iconImageView.clipsToBounds = true
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        backgroundColor = .clear
        selectionStyle = .none
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
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        
        if let photoAttachment = viewModel.photoAttachment {
            postImageView.set(imageUrl: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
}
