//
//  ProfileSectionView.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 27.10.2023.
//

import UIKit

class ProfileSectionView: UIView {
    
    public var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    public let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let image : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = 12
        [image, titleLabel].forEach { self.addSubview($0) }
        applyConstraints()
    }
    
    private func applyConstraints() {
        image.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(9)
        }

        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
