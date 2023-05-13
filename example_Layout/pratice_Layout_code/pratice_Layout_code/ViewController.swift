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
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private var leftSubTitle: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.text = "오빠"
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
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private var rightSubTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "아재"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "flame")
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
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftMainTitle.translatesAutoresizingMaskIntoConstraints = false
        leftSubTitle.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightMainTitle.translatesAutoresizingMaskIntoConstraints = false
        rightSubTitle.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            
            leftView.widthAnchor
            leftView.heightAnchor
            leftView.leadingAnchor
            leftView.topAnchor
        ])
    }


}

