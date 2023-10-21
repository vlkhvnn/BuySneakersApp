//
//  Onb1ViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

class Onb3ViewController: UIViewController {

    private let leftSneakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onb3.1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightSneakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onb3.2")
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
        button.addTarget(self, action: #selector(finalButton), for: .touchUpInside)

        return button
    }()
    
    private let pageControl : UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.currentPage = 3
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
        leftSneakerImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(37)
        }
        
        rightSneakerImageView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(87)
        }
        
        bottomVectorImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(20)
            make.left.equalToSuperview()
        }
        
        bottomSheet.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(10)
            make.height.equalTo(288)
        }
        
        fastLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-180)
        }
        
        getLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-140)
        }
        
        nextButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-58)
            make.height.equalTo(54)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(fastLabel.snp.top).offset(-20)
        }
    }
    
    @objc
    private func finalButton() {
        let vc = MainTabBarController()
        UserDefaults.standard.set(true, forKey: "onboardingCompleted")
        navigationController?.pushViewController(vc, animated: true)
    }
}
