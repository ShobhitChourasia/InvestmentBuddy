//
//  ThemesCollectionViewCell.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: "Verdana-Bold", size: 14)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Adding borders to cell
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        layer.borderColor = UIColor.withAlphaComponent(.lightGray)(0.5).cgColor
        backgroundColor = UIColor.withAlphaComponent(.lightGray)(0.1)

        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(titleView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: titleView.topAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            
            titleView.heightAnchor.constraint(equalToConstant: 36),
            titleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(theme: Themes) {
        titleView.text = theme.title
        imageView.image = UIImage(named: theme.image)
    }
    
}
