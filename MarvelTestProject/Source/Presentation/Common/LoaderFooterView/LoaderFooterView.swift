//
//  LoaderFooterView.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 20.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import UIKit

/// View с лоудером
final class LoaderFooterView: NibTableFooterView {
    
    // MARK: - IBOutlets

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - UITableViewHeaderFooterView
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        activityIndicator.startAnimating()
    }
}
