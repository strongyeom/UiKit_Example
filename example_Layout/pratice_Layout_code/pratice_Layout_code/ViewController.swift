//
//  ViewController.swift
//  pratice_Layout_code
//
//  Created by 염성필 on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties

    private var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private var leftMainTitle: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.text = "당근이세요?"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private var leftSubTitle: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.text = "오빠"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private var rightMainTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "당근이지!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private var rightSubTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "아재"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "flame"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - LiftCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        
        view.addSubview(leftView)
        view.addSubview(leftMainTitle)
        view.addSubview(leftSubTitle)
        view.addSubview(rightView)
        view.addSubview(rightMainTitle)
        view.addSubview(rightSubTitle)
        view.addSubview(imageView)
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftMainTitle.translatesAutoresizingMaskIntoConstraints = false
        leftSubTitle.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightMainTitle.translatesAutoresizingMaskIntoConstraints = false
        rightSubTitle.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            
            leftView.widthAnchor.constraint(equalToConstant: view.frame.width/2),
            leftView.heightAnchor.constraint(equalToConstant: 200),
            leftView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            leftView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            rightView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor),
            rightView.heightAnchor.constraint(equalToConstant: 200),
            rightView.topAnchor.constraint(equalTo: leftView.topAnchor),
            rightView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            leftMainTitle.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 10),
            leftMainTitle.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 15),
            leftMainTitle.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -10),
            leftSubTitle.leadingAnchor.constraint(equalTo: leftMainTitle.leadingAnchor, constant: 10),
            leftSubTitle.topAnchor.constraint(equalTo: leftMainTitle.bottomAnchor, constant: 30),
            leftSubTitle.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -10),
            
            rightMainTitle.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 10),
            rightMainTitle.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 15),
            rightMainTitle.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -10),
            rightSubTitle.leadingAnchor.constraint(equalTo: rightMainTitle.leadingAnchor, constant: 10),
            rightSubTitle.topAnchor.constraint(equalTo: rightMainTitle.bottomAnchor, constant: 30),
            rightSubTitle.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -10),

            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.bottomAnchor.constraint(equalTo: leftView.bottomAnchor)

        ])
    }


}

