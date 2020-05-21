//
//  RoundedImageView.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 20.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import UIKit

/// ImageView с закругленными углами
final class RoundedImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 7
    }
}
