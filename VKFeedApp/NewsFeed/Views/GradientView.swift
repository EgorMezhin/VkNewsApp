//
//  GradientView.swift
//  VKFeedApp
//
//  Created by Egor Lass on 02.03.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private var firstColor = UIColor.yellow.cgColor
    private var secondColor = UIColor.orange.cgColor
    private var thirdColor = UIColor.red.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [firstColor, secondColor, thirdColor]
    }
}
