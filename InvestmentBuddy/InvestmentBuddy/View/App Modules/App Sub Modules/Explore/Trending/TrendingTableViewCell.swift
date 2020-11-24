//
//  TrendingTableViewCell.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 24/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    private let categoryImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleView: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.init(name: "Verdana-Bold", size: 14)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleView: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.init(name: "Verdana-Bold", size: 14)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    private let percetageChange: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "+18.98%"
        label.font = UIFont.init(name: "Verdana-Bold", size: 12)
        label.textColor = .white
        return label
    }()

    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.withAlphaComponent(.lightGray)(0.5)
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        subTitleView.translatesAutoresizingMaskIntoConstraints = false
        percetageChange.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(categoryImageView)
        addSubview(titleView)
        addSubview(subTitleView)
        addSubview(separatorView)
        addSubview(percetageChange)
        
        NSLayoutConstraint.activate([
            
            categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: 40),
            categoryImageView.widthAnchor.constraint(equalToConstant: 40.0),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            titleView.heightAnchor.constraint(equalToConstant: 18),
            titleView.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 18),
            
            subTitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 4),
            subTitleView.heightAnchor.constraint(equalToConstant: 18),
            subTitleView.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 18),
            
            percetageChange.centerYAnchor.constraint(equalTo: centerYAnchor),
            percetageChange.heightAnchor.constraint(equalToConstant: 26),
            percetageChange.widthAnchor.constraint(equalToConstant: 80.0),
            percetageChange.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(company: TrendingData) {
        titleView.text = company.title
        categoryImageView.image = UIImage(named: company.image)
        subTitleView.text = company.domain
        
        customizePercentView(value: company.percentageChange)
    }
    
}

private extension TrendingTableViewCell {
    
    func customizePercentView(value: Float) {
        if value > 0 {
            percetageChange.text = "+" + "\(value)" + "%"
            percetageChange.backgroundColor = UIColor(red: 73/255.0, green: 218/255.0, blue: 181/255.0, alpha: 1.0)
        }
        else {
            percetageChange.text = "\(value)" + "%"
            percetageChange.backgroundColor = UIColor(red: 250/255.0, green: 107/255.0, blue: 110/255.0, alpha: 1.0)
        }
        percetageChange.layer.borderColor = UIColor.clear.cgColor
        percetageChange.layer.cornerRadius = 13
        percetageChange.layer.masksToBounds = true
    }
    
}
