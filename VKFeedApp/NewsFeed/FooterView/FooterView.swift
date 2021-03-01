//
//  FooterView.swift
//  VKFeedApp
//
//  Created by Egor Lass on 02.03.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let loader: UIActivityIndicatorView = {
       let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(loader)
        
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        loader.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func showLoader() {
        loader.startAnimating()
    }
    func setTitle(_ title: String?) {
        loader.stopAnimating()
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
