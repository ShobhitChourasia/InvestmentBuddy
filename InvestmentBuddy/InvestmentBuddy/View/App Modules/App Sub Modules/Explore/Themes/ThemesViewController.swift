//
//  ThemesViewController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class ThemesViewController: CustomViewController<ThemesView> {

    var viewModel = ThemesViewModel()
    
    private var themes = [Themes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindViewModel()
        viewModel.getThemesData()
    }
    
}

private extension ThemesViewController {
    func bindViewModel() {
        viewModel.themes.observe(on: self) { [weak self] in self?.reloadCollectionView(themeData: $0) }
    }
    
    func reloadCollectionView(themeData: [Themes]) {
        themes = themeData
    }
}

private typealias CollectionViewHelper = ThemesViewController
extension CollectionViewHelper: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        
        customView.collectionView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: "themesCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "themesCell", for: indexPath) as? ThemesCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(theme: themes[indexPath.row])
        return cell
    }
}

private typealias CollectionViewLayoutHelper = ThemesViewController
extension CollectionViewLayoutHelper: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: customView.frame.size.width/2 - 32, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
}
