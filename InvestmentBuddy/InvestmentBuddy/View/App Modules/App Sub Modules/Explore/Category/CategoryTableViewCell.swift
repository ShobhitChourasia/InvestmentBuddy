//
//  CategoryTableViewCell.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 23/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    private let wrapperView: UIView = {
       let view = UIView()
        return view
    }()
    
    private let imageWrapperView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let categoryImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: "Verdana-Bold", size: 14)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        imageWrapperView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(wrapperView)
        
        imageWrapperView.addSubview(categoryImageView)
        wrapperView.addSubview(imageWrapperView)
        wrapperView.addSubview(titleView)
        
        NSLayoutConstraint.activate([
            
            wrapperView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            imageWrapperView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            imageWrapperView.heightAnchor.constraint(equalToConstant: 50),
            imageWrapperView.widthAnchor.constraint(equalToConstant: 50.0),
            imageWrapperView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 12),
            
            categoryImageView.topAnchor.constraint(equalTo: imageWrapperView.topAnchor, constant: 8),
            categoryImageView.bottomAnchor.constraint(equalTo: imageWrapperView.bottomAnchor, constant: -8),
            categoryImageView.leadingAnchor.constraint(equalTo: imageWrapperView.leadingAnchor, constant: 8),
            categoryImageView.trailingAnchor.constraint(equalTo: imageWrapperView.trailingAnchor, constant: -8),
            
            titleView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            titleView.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 18),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(category: Category) {
        titleView.text = category.title
        categoryImageView.image = UIImage(named: category.image)
        
        var viewBackgroundColor = UIColor.clear
        switch category.title {
        case "Stocks":
            viewBackgroundColor = UIColor(red: 166/255.0, green: 166/255.0, blue: 251/255.0, alpha: 1.0)
        case "ETFs":
            viewBackgroundColor = UIColor(red: 78/255.0, green: 84/255.0, blue: 204/255.0, alpha: 1.0)
        case "Crypto":
            viewBackgroundColor = UIColor(red: 253/255.0, green: 214/255.0, blue: 78/255.0, alpha: 1.0)
        default:()
        }
        
        wrapperView.backgroundColor = viewBackgroundColor
        customizeView()
    }
    
}

private extension CategoryTableViewCell {
    
    func customizeView() {
        wrapperView.layer.borderColor = UIColor.clear.cgColor
        wrapperView.layer.cornerRadius = 40
        
        imageWrapperView.layer.borderColor = UIColor.clear.cgColor
        imageWrapperView.layer.cornerRadius = 25
    }
    
}
