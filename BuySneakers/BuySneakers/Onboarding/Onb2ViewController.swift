//
//  Onb1ViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

class Onb2ViewController: UIViewController {

    private let leftSneakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onb2.2")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightSneakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onb2.1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomVectorImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onb2.3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomSheet : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let fastLabel : UILabel = {
        let label = UILabel()
        label.text = "Fast Shipping"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let getLabel : UILabel = {
        let label = UILabel()
        label.text = "Get all of your desired sneakers in one place"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(toNextButton), for: .touchUpInside)
        return button
    }()
    
    private let pageControl : UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 2
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        bottomSheet.addSubview(fastLabel)
        bottomSheet.addSubview(getLabel)
        bottomSheet.addSubview(nextButton)
        bottomSheet.addSubview(pageControl)
        [leftSneakerImageView, rightSneakerImageView, bottomVectorImageView, bottomSheet].forEach {
            view.addSubview($0)
        }
        applyConstraints()
    }
    
    private func applyConstraints() {
        let leftSneakerImageViewConstraints = [
            leftSneakerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftSneakerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
        ]
        
        let rightSneakerImageViewConstraints = [
            rightSneakerImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            rightSneakerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 87)
        ]
        
        let bottomVectorImageViewConstraints = [
            bottomVectorImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            bottomVectorImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        
        let bottomSheetConstraints = [
            bottomSheet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            bottomSheet.heightAnchor.constraint(equalToConstant: 288)
        ]
        
        let fastLabelConstraints = [
            fastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fastLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180)
        ]
        
        let getLabelConstraints = [
            getLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140)
        ]
        
        let nextButtonConstraints = [
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 54),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58)
        ]
        
        let pageControlConstraints = [
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: fastLabel.topAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(leftSneakerImageViewConstraints)
        NSLayoutConstraint.activate(rightSneakerImageViewConstraints)
        NSLayoutConstraint.activate(bottomVectorImageViewConstraints)
        NSLayoutConstraint.activate(bottomSheetConstraints)
        NSLayoutConstraint.activate(fastLabelConstraints)
        NSLayoutConstraint.activate(getLabelConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
        NSLayoutConstraint.activate(pageControlConstraints)
    }
    
    @objc
    private func toNextButton() {
        let vc = Onb3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
