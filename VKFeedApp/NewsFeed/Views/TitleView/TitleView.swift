//
//  TitleView.swift
//  VKFeedApp
//
//  Created by Egor Lass on 01.03.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

protocol TitleViewViewModel {
    var photoUrlString: String? { get }
}

class TitleView: UIView {
    
    private var myAvatarView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var myTextField = InsetableTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(myTextField)
        addSubview(myAvatarView)
        makeConstraints()
    }
    
    func set(userViewModel: TitleViewViewModel) {
        myAvatarView.set(imageUrl: userViewModel.photoUrlString)
    }
    
    private func makeConstraints() {
        myAvatarView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myAvatarView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 4).isActive = true
        myAvatarView.heightAnchor.constraint(equalTo: myTextField.heightAnchor, multiplier: 1).isActive = true
        myAvatarView.widthAnchor.constraint(equalTo: myTextField.heightAnchor, multiplier: 1).isActive = true
        
        myTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        myTextField.trailingAnchor.constraint(equalTo: myAvatarView.leadingAnchor, constant: -10).isActive = true
        myTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        
    }
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myAvatarView.layer.masksToBounds = true
        myAvatarView.layer.cornerRadius = myAvatarView.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
