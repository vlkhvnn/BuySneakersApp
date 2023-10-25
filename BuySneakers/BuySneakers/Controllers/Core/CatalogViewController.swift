//
//  CatalogViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

class CatalogViewController: UIViewController {
    
    public var shoes : [Shoe] = ShoeService.shared.getAllShoes()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let newCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return newCollectionView
    }()
    
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hello, Sneakerhead!"
        view.addSubview(collectionView)
        view.backgroundColor = Colors.grayMainBackground
        collectionView.backgroundColor = Colors.grayMainBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ShoeCollectionViewCell.self, forCellWithReuseIdentifier: ShoeCollectionViewCell.identifier)
        applyConstraints()
    }
    
    private func applyConstraints() {
        collectionView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
}

extension CatalogViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoeCollectionViewCell.identifier, for: indexPath) as? ShoeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.shoe = shoes[indexPath.item]
        return cell
    }
}


extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right + 10.0
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / 2
        let height: CGFloat = 282
        return CGSize(width: widthPerItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }
}
