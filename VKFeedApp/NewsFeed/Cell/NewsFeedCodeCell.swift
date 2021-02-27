//
//  NewsFeedCodeCell.swift
//  VKFeedApp
//
//  Created by Egor Lass on 27.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

final class NewsFeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsFeedCodeCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = Constants.postLabelFont
        label.textColor = #colorLiteral(red: 0.1961038411, green: 0.1960522234, blue: 0.2003527582, alpha: 1)
        return label
    }()
    
    let postImageView: WebImageView = {
        let imageView = WebImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.1961038411, green: 0.1960522234, blue: 0.2003527582, alpha: 1)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let likeNumberView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentNumberView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
    let shareNumberView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
    let viewNumberView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
    let likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "like")
        return imageView
    }()
    
    let commentImage: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "comment")
           return imageView
       }()
    
    let shareImage: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "share")
           return imageView
       }()
    
    let viewImage: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "eye")
        
           return imageView
       }()
    
    let likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 0.8470588235)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        label.text = "423"
        return label
    }()
    
    let commentLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 0.8470588235)
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.lineBreakMode = .byClipping
            label.text = "67"
           return label
       }()
    
    let shareLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 0.8470588235)
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.lineBreakMode = .byClipping
        label.text = "4"
           return label
       }()
    
    let viewLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 0.8470588235)
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.lineBreakMode = .byClipping
        label.text = "1401"
           return label
       }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

         cardView.layer.cornerRadius = 10
               cardView.clipsToBounds = true
               
               backgroundColor = .clear
               selectionStyle = .none
        overlayFirstLayer()
        overlaySecondLayer()
        overlayThirdLayerOnTopView()
        overlayThirdLayerOnBottomView()
        overlayFourthLayerOnBottomViews()

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
    
    private func overlayFirstLayer() {
        addSubview(cardView)
        
        cardView.fillSuperview(padding: Constants.cardInsets)
    }
    
    private func overlaySecondLayer() {
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)

        
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
    }
    
    private func overlayThirdLayerOnTopView() {
        topView.addSubview(iconImageView)
        topView.addSubview(dateLabel)
        topView.addSubview(nameLabel)
        
        iconImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.topViewHeight / 2 - 3).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    private func overlayThirdLayerOnBottomView() {
        bottomView.addSubview(likeNumberView)
         bottomView.addSubview(commentNumberView)
         bottomView.addSubview(shareNumberView)
         bottomView.addSubview(viewNumberView)

        likeNumberView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        likeNumberView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        likeNumberView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewHeight).isActive = true
        likeNumberView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
        
        commentNumberView.leadingAnchor.constraint(equalTo: likeNumberView.trailingAnchor).isActive = true
        commentNumberView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        commentNumberView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewHeight).isActive = true
        commentNumberView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true

        shareNumberView.leadingAnchor.constraint(equalTo: commentNumberView.trailingAnchor).isActive = true
        shareNumberView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        shareNumberView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewHeight).isActive = true
        shareNumberView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true

        viewNumberView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
        viewNumberView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        viewNumberView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewHeight).isActive = true
        viewNumberView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true

    }
    
    private func overlayFourthLayerOnBottomViews() {
        likeNumberView.addSubview(likeImage)
        likeNumberView.addSubview(likeLabel)
        
        commentNumberView.addSubview(commentImage)
        commentNumberView.addSubview(commentLabel)
        
        shareNumberView.addSubview(shareImage)
        shareNumberView.addSubview(shareLabel)
        
        viewNumberView.addSubview(viewImage)
        viewNumberView.addSubview(viewLabel)
        
        constraintInFourthLayer(view: likeNumberView, imageView: likeImage, label: likeLabel)
            constraintInFourthLayer(view: commentNumberView, imageView: commentImage, label: commentLabel)
            constraintInFourthLayer(view: shareNumberView, imageView: shareImage, label: shareLabel)
            constraintInFourthLayer(view: viewNumberView, imageView: viewImage, label: viewLabel)
        
        
    }
    
    private func constraintInFourthLayer(view: UIView, imageView: UIImageView, label: UILabel) {
        
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.buttonViewViewsIconSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.buttonViewViewsIconSize).isActive = true
        
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 6).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
