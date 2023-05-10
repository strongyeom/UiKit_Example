//
//  ViewController.swift
//  pratice_Layout_code
//
//  Created by 염성필 on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    
    private var subTitle: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "여기는 앱의 목록이에요."
        return label
    }()
    
    private var mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.text = "열심히 하자"
        return label
    }()
    
    
    private var subText: UILabel = {
        let label = UILabel()
        label.text = "서브 텍스트"
        label.textColor = .link
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private var mainText: UILabel = {
        let label = UILabel()
        label.text = "메인 텍스트메인 텍스트메인 텍스트메인 텍스트메인 텍스트"
        label.textColor = .link
        label.backgroundColor = .blue
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "flame")
        return image
    }()
    
    private var clickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("button", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    
    // MARK: - LiftCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(subText)
        view.addSubview(mainText)
        view.addSubview(imageView)
        view.addSubview(clickButton)
        view.addSubview(subTitle)
        view.addSubview(mainTitle)
        
        subText.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            subTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            subTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            mainTitle.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            mainTitle.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            mainTitle.trailingAnchor.constraint(equalTo: subTitle.trailingAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            
            subText.topAnchor.constraint(equalTo: imageView.topAnchor),
            subText.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            subText.trailingAnchor.constraint(equalTo: mainText.trailingAnchor),
            
            mainText.leadingAnchor.constraint(equalTo: subText.leadingAnchor),
            mainText.topAnchor.constraint(equalTo:  subText.bottomAnchor, constant: 10),
            mainText.trailingAnchor.constraint(equalTo: clickButton.leadingAnchor, constant: -10),
            
            clickButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            clickButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            clickButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }


}

